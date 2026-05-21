import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/functions/function.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';
import 'package:flutter_first_project/widget/shimmer_widget.dart';

class SubjectDetailScreen extends StatefulWidget {
  final int index;
  final String titleName;
  final String time;
  final String teacher;
  final String date;

  const SubjectDetailScreen({
    super.key,
    required this.index,
    required this.titleName,
    required this.time,
    required this.teacher,
    required this.date,
  });

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.titleName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, ['Welcome back!!!', DateTime.now()]);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: _isLoading ? ShimmerWidget() : _buildBodys,
    );
  }

  get _buildBodys => Container(
    height: 300,
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('assets/image/profile_sithy.jpg'),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.index.toString(), style: AppTextStyle.bold18()),
                Text('Time: ${widget.time}', style: AppTextStyle.bold18()),
                Text("Date: ${widget.date}", style: AppTextStyle.bold18()),
              ].withSpaceBetween(height: 15),
            ),
          ),
        ),
      ],
    ),
  );

  // get _buildBody => Center(
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(widget.index.toString(), style: AppTextStyle.bold26()),
  //       Text('Time: ${widget.time}', style: AppTextStyle.bold26()),
  //       Text("Teacher Name: ${widget.teacher}", style: AppTextStyle.bold26()),
  //       Text("Date: ${widget.date}", style: AppTextStyle.bold26()),
  //     ],
  //   ),
  // );
}
