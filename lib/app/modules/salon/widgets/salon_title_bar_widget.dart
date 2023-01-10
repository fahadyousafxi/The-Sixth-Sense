/*
 * File name: salon_title_bar_widget.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonTitleBarWidget extends StatelessWidget implements PreferredSize {
  final Widget title;
  final Widget tabBar;

  const SalonTitleBarWidget({Key key, @required this.title, this.tabBar}) : super(key: key);

  Widget buildTitleBar() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30),
            // boxShadow: [
            //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
            // ],
          ),
          child: title,
        ),
        tabBar
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTitleBar();
  }

  @override
  Widget get child => buildTitleBar();

  @override
  Size get preferredSize => new Size(Get.width, 160);
}
