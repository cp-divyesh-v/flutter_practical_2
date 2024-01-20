import 'package:flutter/material.dart';
import 'package:flutter_practical_2/Data/Repositories/UserRepository.dart';
import 'package:flutter_practical_2/Extensions/String+Extension.dart';
import 'package:flutter_practical_2/Styles/Spacer.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user != null ? _body(context, _user!)
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
                Text('Ready to workout?',
                  style: AppTextStyle.header1(),
                ),
              ],
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3), // Border radius
                child: ClipOval(
                    child: user.profileImage != null ? Image.network(user.profileImage!)
                        : Image.asset('assets/images.profile_image.jpg')),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _monitoringThings(context, user.bodyMonitors != null ? user.bodyMonitors! : [])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _monitoringThings(context, List<BodyMonitors> monitoring) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...monitoring.map((bodyMonitor) {
            return Container(
              child: _bodyMonitorCell(context, bodyMonitor),
            );
            
          }),
        ],
      ),
    );
  }

  Widget _bodyMonitorCell(context, BodyMonitors bodyMonitors) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(bodyMonitors.image != null ? bodyMonitors.image! : ''),
            Vspacer(),
            Text(bodyMonitors.title != null ? bodyMonitors.title! : '',
            style: AppTextStyle.normal()),
            Vspacer(height: 10),
            Text(bodyMonitors.value != null ? bodyMonitors.value! : '',
            style: AppTextStyle.title()),
          ],
        ),
      ),
    );
  }


}