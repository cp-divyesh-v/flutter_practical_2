import 'package:flutter/material.dart';
import 'package:flutter_practical_2/UI/Home/HomeView.dart';
import 'package:flutter_practical_2/UI/Home/WorkoutDetailView.dart';
import 'package:flutter_practical_2/UI/Home/WorkoutScreen.dart';

class HomeTabRouteView extends StatefulWidget {
  const HomeTabRouteView({super.key});

  @override
  State<HomeTabRouteView> createState() => _HomeTabRouteViewState();
}

class _HomeTabRouteViewState extends State<HomeTabRouteView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    WorkoutDetailView(),
    WorkoutScreen(),
    Text(
      'Index 3: Progress',
      style: optionStyle,
    ),
    Text(
      'Index 3: Chat',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _bottomBarView(context),
    );
  }

  Widget _bottomBarView(context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black26,
        selectedItemColor: const Color(0xfff4bb81),
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
