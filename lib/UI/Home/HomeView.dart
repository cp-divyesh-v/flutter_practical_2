import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practical_2/Data/Repositories/UserRepository.dart';
import 'package:flutter_practical_2/Extensions/String+Extension.dart';
import 'package:flutter_practical_2/Styles/Spacer.dart';
import 'package:flutter_practical_2/Utils/RndomNumHelper.dart';

import '../../Data/Models/User.dart';
import '../../Styles/AppTextStyle.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserRepository _userRepository = UserRepository.shared;
  User? _user;
  WorkoutPrograms? _currentPrograms;
  List<Color> colors = [
    const Color(0xFFFFF3DE),
    const Color(0xEBF2F4FF),
    const Color(0xFBF2EBFF),
    const Color(0xEBF2F4FF),
    const Color(0xfffaf2e6)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUser();
  }

  void _fetchUser() async {
    User user = await _userRepository.getUser();
    setState(() {
      _user = user;
      _currentPrograms = user.workoutPrograms?.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user != null
        ? _body(context, _user!)
        : const CircularProgressIndicator();
  }

  Widget _body(context, User user) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning, ${user.userName != null ? user.userName!.capitalize() : 'Hey there'}!',
                  style: AppTextStyle.subtitle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ready to workout?',
                  style: AppTextStyle.header1(),
                ),
              ],
            ),
            _roundedImage(
                imageUrl: user.profileImage != null
                    ? user.profileImage!
                    : 'assets/images.profile_image.jpg',
                radius: 25,
                isNetworkImage: user.profileImage != null)
          ],
        ),
      ),
      body: Container(
        color: Color(0xfffffcf9),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Vspacer(height: 15),
                  _monitoringThings(user.bodyMonitors!),
                  Vspacer(height: 15),
                  _titleView("Workout programs"),
                  _workoutTypeList(
                      user.workoutPrograms != null ? user.workoutPrograms! : []),
                  Vspacer(height: 15),
                  _coachListView(_currentPrograms?.items ?? []),
                  Vspacer(height: 20),
                  _mapAndMoreView(),
                  Vspacer(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _monitoringThings(List<BodyMonitors> monitoring) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...monitoring.map((bodyMonitor) {
            return SizedBox(
              // height: 180,
              width: 170,
              child: _bodyMonitorCell(bodyMonitor, monitoring.indexOf(bodyMonitor)),
            );
          }),
        ],
      ),
    );
  }

  Widget _bodyMonitorCell(BodyMonitors bodyMonitors, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        decoration: BoxDecoration(
            color: colors[index % colors.length], borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        bodyMonitors.image != null ? bodyMonitors.image! : ''),
                  )),
              Vspacer(),
              Text(bodyMonitors.title != null ? bodyMonitors.title! : '',
                  style: AppTextStyle.normal()),
              Vspacer(height: 10),
              Text(bodyMonitors.value != null ? bodyMonitors.value! : '',
                  style: AppTextStyle.header1()),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _workoutTypeList(List<WorkoutPrograms> workoutPrograms) {
    List<String> types =
        workoutPrograms.map((e) => e.type).toList().nonNulls.toList();
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...types.map((type) {
            return Container(
              padding: const EdgeInsets.all(8),
              height: 60,
              child: workoutProgramTypeCell(type, type == _currentPrograms?.type),
            );
          }),
        ],
      ),
    );
  }

  Widget workoutProgramTypeCell(String type, bool isSelected) {
    return OutlinedButton(
      onPressed: () {
        _currentPrograms = _user?.workoutPrograms?.firstWhere((element) => element.type == type);
        // Perform an action when the button is pressed
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xfffff5e6) : null,
        foregroundColor: const Color(0xff0c434a),
        side: isSelected ? BorderSide.none : const BorderSide(color: Color(0xfffaf1e6)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(type,
        style: AppTextStyle.title(),
      ),
    );
  }

  Widget _titleView(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyle.header1()),
      ),
    );
  }

  Widget _coachListView(List<Items> coaches) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...coaches.map((coach) {
            return _coachCard(coach, coaches.indexOf(coach));
          }),
        ],
      ),
    );
  }

  Widget _coachCard(Items item, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 350,
        height: 300,
        decoration: BoxDecoration(
          color: colors[index % colors.length],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                    child: Text("Coach: \nStretch", style: AppTextStyle.header2())
                ),
                Vspacer(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                    child: Text(item.time ?? "", style: AppTextStyle.title())
                ),
                _userListView(item.userImages ?? [])
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:  Image.network(item.coachImage ?? "",
                  fit: BoxFit.fill,
                  height: 150.0,
                  width: 100.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userListView(List<String> userImages) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Row(
              children: [
                Stack(
                  children: List.generate(
                    userImages.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: (19 * index).toDouble()),
                      child: _userImage(userImages[index]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _userImage(String imageName) {
    return _roundedImage(
        imageUrl: imageName,
        radius: 25,
        padding: 2,
        isNetworkImage: true
    );
  }

  Widget _roundedImage({
    required String imageUrl,
    required double radius,
    double padding = 3,
    Color backgroundColor = Colors.white,
    bool isNetworkImage = false,
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(padding), // Border radius
        child: Container(
            width: radius*2,
            height: radius*2,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: isNetworkImage
                ? Image.network(imageUrl, fit: BoxFit.cover)
                : Image.asset(imageUrl, fit: BoxFit.cover)),
      ),
    );
  }

  Widget _mapAndMoreView() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xfffff5e6),
            ),
            padding: const EdgeInsets.all(15),
            width: 100,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/location.png",
                height: 30,
                  width: 30,
                ),
                Vspacer(height: 15),
                Text("see\nroute", style: AppTextStyle.medium()),
              ],
            ),
          ),
          HSpacer(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/images/map_view.png",
            fit: BoxFit.fill,
              height: 200,
              width: 280,
            ),
          ),
        ],
      ),
    );
  }

}
