import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/functions/function.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';
import 'package:flutter_first_project/screen/subject_detail.dart';
import 'package:flutter_first_project/widget/bottom_navigation_bar_widget.dart';
import 'package:flutter_first_project/widget/date_time_line_widget.dart';
import 'package:flutter_first_project/widget/schedule_card.dart';

class HomeSmall extends StatefulWidget {
  const HomeSmall({super.key});

  @override
  State<HomeSmall> createState() => _HomeSmallState();
}

class _HomeSmallState extends State<HomeSmall> {
  int currentIndex = 0;

  void bottomNavigationBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }