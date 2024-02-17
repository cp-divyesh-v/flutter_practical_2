import 'package:flutter/material.dart';
import 'package:flutter_practical_2/Data/Repositories/UserRepository.dart';
import 'package:flutter_practical_2/Styles/Spacer.dart';
import 'package:flutter_practical_2/UI/Home/HomeView.dart';
import 'package:flutter_practical_2/Utils/RoundedButtonAppBar.dart';

import '../../Data/Models/User.dart';
import '../../Styles/AppTextStyle.dart';

class WorkoutDetailView extends StatefulWidget {
  const WorkoutDetailView({super.key});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  final UserRepository _userRepository = UserRepository.shared;
  User? _user;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user != null ? _body(_user!) : const CircularProgressIndicator();
  }

  Widget _body(User user) {
    return Scaffold(
      appBar: AppBar(
        title: roundedButtonAppBar(
            title: 'Sharon Howard', subtitle: 'Yoga trainer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: const Color(0xfffffcf9),
        child: ListView(
          children: [
            roundedImage(
                imageUrl: "assets/images/yoga_trainer.jpeg", radius: 100),
            Vspacer(height: 15),
            _workoutGrid(user.bodyMonitors ?? [], colors),
            Vspacer(height: 15),
            const DurationCard(),
            Vspacer(height: 15),
            getMoreWorkoutButton()
          ],
        ),
      ),
    );
  }

  Widget getMoreWorkoutButton() {
    return TextButton(
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xfffbce84),
            borderRadius: BorderRadius.circular(12),
          ),
          width: double.maxFinite,
          height: 50,
          child: Center(
              child: Text("20 More workout",
                  style: AppTextStyle.title(fontColor: Colors.white))),
        ));
  }
}

Widget _workoutGrid(List<BodyMonitors> monitoring, List<Color> colors) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: monitoring.length,
      itemBuilder: (context, index) {
        return bodyMonitorCell(monitoring[index], index, colors,
            width: double.maxFinite, leftPadding: 0);
      },
    ),
  );
}

class DurationCard extends StatefulWidget {
  const DurationCard({super.key});

  @override
  State<DurationCard> createState() => _DurationCardState();
}

class _DurationCardState extends State<DurationCard> {
  List<String> durations = ["1-10", "10-20", "20-30"];
  String selectedDuration = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDuration = durations.first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffede5ff),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Duration",
              style: AppTextStyle.header2(),
            ),
            Vspacer(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...durations.map((e) => Card(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedDuration = e;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: e == selectedDuration
                                  ? const Color(0xff9479d4)
                                  : const Color(0xffede5ff),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$e min",
                                style: AppTextStyle.medium(
                                    fontColor: e == selectedDuration
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
