import 'package:flutter/material.dart';
import 'package:flutter_first_project/screen/subject_detail.dart';
import 'package:flutter_first_project/widget/card_home_widget.dart';
import 'package:flutter_first_project/widget/date_time_line_widget.dart';
import 'package:flutter_first_project/widget/schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void bottomNavigationBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  DateTime selectDate = DateTime.now();

  void onChageDate(DateTime dateValue) {
    setState(() {
      selectDate = dateValue;
    });
  }get screen => [
    _buildBodyHome,
    Container(color: Colors.amber),
    Container(color: Colors.blue),
  ];

  Future<void> _navigateAndDisplaySelection(
    BuildContext context, {
    required int index,
    required String titleName,
    required String time,
    required String teacher,
    required String data,
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubjectDetailScreen(
          index: index,
          titleName: titleName,
          time: time,
          teacher: teacher,
          date: DateTime.now().toString(),
        ),
      ),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('${result[1]}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new_rounded),
      //     onPressed: () {
      //       Navigator.pop(context, ['Welcome back!!!']);
      //     },
      //   ),
      // ),
      body: screen[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }