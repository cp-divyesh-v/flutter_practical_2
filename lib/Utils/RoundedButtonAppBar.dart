import 'package:flutter/material.dart';

import '../Styles/AppTextStyle.dart';
import 'RoundedIconButton.dart';

Widget roundedButtonAppBar({String? title, String? subtitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      roundedCornerIconButton(icon: Icons.chevron_left),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '', style: AppTextStyle.header1()),
          Text(subtitle ?? '', style: AppTextStyle.subtitle()),
        ],
      ),
      roundedCornerIconButton(icon: Icons.more_horiz)
    ],
  );
}
