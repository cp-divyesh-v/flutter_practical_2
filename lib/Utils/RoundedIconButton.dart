import 'package:flutter/material.dart';

Widget roundedCornerIconButton(
    {required IconData icon, Color color = Colors.black}) {
  return IconButton(
      onPressed: () {},
      icon: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xfffff3df)),
        child: Icon(icon, color: color),
      ));
}
