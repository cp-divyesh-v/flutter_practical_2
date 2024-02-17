import 'package:flutter/material.dart';
import 'package:flutter_practical_2/Styles/AppTextStyle.dart';
import 'package:flutter_practical_2/Styles/Spacer.dart';

import '../../Utils/RoundedButtonAppBar.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: roundedButtonAppBar(title: 'Strength'),
        ),
        body: ListView(
          children: [
            Column(
              children: [_imageView(), Vspacer(height: 20), counterCard()],
            ),
          ],
        ));
  }

  Widget _imageView() {
    return Center(
      child: Image.network(
        "https://cdn.pixabay.com/photo/2016/03/31/20/26/exercise-1295761_1280.png",
        fit: BoxFit.fitHeight,
        width: 300,
        height: 400,
      ),
    );
  }

  Widget counterCard() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: const Color(0xfffff7e9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              repsAndSetsView(),
              Vspacer(height: 15),
              counterCircle(),
              Vspacer(height: 15),
              startPlayPauseButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget repsAndSetsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [labelCounter('Reps', '26'), labelCounter('Set', '2/5')],
    );
  }

  Widget labelCounter(String title, String value) {
    return Row(
      children: [
        Text(title, style: AppTextStyle.subtitle()),
        HSpacer(width: 5),
        Text(value, style: AppTextStyle.title())
      ],
    );
  }

  Widget counterCircle() {
    double height = 150;
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
          color: const Color(0xFFFBCE84),
          borderRadius: BorderRadius.circular(height / 2)),
      child: Center(
          child: Text('25',
              style: AppTextStyle.header1(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  fontColor: Colors.white))),
    );
  }

  Widget startPlayPauseButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Start', style: AppTextStyle.medium()),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Pause', style: AppTextStyle.header1(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {},
          child: Text('End', style: AppTextStyle.medium()),
        ),
      ],
    );
  }
}
