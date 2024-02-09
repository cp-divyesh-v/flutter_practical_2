import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_2/Data/Repositories/UserRepository.dart';

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
    return _user != null
        ? _body(_user!)
        : const CircularProgressIndicator();
  }

  Widget _body(User user) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('', style: AppTextStyle.subtitle(fontSize: 16)),
                Text('', style: AppTextStyle.header1()),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: const Color(0xfffffcf9),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
