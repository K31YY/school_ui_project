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
  }DateTime selectDate = DateTime.now();

  void onChageDate(DateTime dateValue) {
    setState(() {
      selectDate = dateValue;
    });
  }

  get screen => [
    _buildBody,
    Container(color: Colors.amber),
    Container(color: Colors.blue),
    Container(color: Colors.orange),
    Container(color: Colors.green),
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

    if (result != null && result.length > 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('${result[1]}')));
    }
  }

  List iconList = [
    Icons.home_filled,
    Icons.school,
    Icons.grid_view_rounded,
    Icons.chat,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          bottomNavigationBarTap(index);
        },
      ),
    );
  }

  get _buildBody {
    return CustomScrollView(
      slivers: [
        _buildAppBar,
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              DateTimeLineWidget(
                initialDate: selectDate,
                onDateChange: (value) {
                  onChageDate(value);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        _buildSchedule(selectDate),
      ],
    );
  }

  get _buildAppBar {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 428,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double expandedHeight = 435;
          double currentHeight = constraints.biggest.height;
          bool isCollapsed = currentHeight < expandedHeight * 0.35;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: isCollapsed
                ? AppTheme.secondarySwatch[900]
                : AppColors.background,
            child: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                bottom: isCollapsed ? 16 : 0,
                top: isCollapsed ? 0 : 50,
              ),
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: isCollapsed ? 1.0 : 0.0,
                child: Text(
                  'Khoeurt Sokhy',
                  style: AppTextStyle.bold26(color: Colors.white),
                ),
              ),
              background: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.secondarySwatch,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            '9th Grade',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          _buildHeaderButtons(),
                          const SizedBox(height: 120),
                        ].withSpaceBetween(height: 8),
                      ),
                    ),
                    _buildGradeDetails(),
                    Positioned(top: -30, child: _buildProfileImage()),
                    if (!isCollapsed)
                      Positioned(
                        top: 100,
                        child: Text(
                          'Khoeurt Sokhy',
                          style: AppTextStyle.bold26(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGradeDetails() {
    List<Map<String, String>> grades = [
      {"title": "A-", "subtitle": "Letter grade"},
      {"title": "90-92", "subtitle": "Grade, %"},
      {"title": "3.7", "subtitle": "GPA"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondarySwatch[900],
        borderRadius: BorderRadius.circular(35),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: grades.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          mainAxisExtent: 90,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.secondarySwatch.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  grades[index]["title"]!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  grades[index]["subtitle"]!,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 105,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2),
        color: Colors.grey,
        image: const DecorationImage(
          image: AssetImage('assets/image/profile_sokhy.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderButtons() {
    List<Map<String, dynamic>> buttons = [
      {
        "icon": Icons.rocket_launch,
        "text": "Academic success",
        "color": Colors.green,
      },
      {"icon": Icons.book, "text": "Homework", "color": Colors.purple},
      {"icon": Icons.person, "text": "Profile", "color": Colors.amber},
    ];

    return SizedBox(
      height: 88,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == buttons.length - 1 ? 0 : 10,
            ),
            child: _buildHeaderButton(
              buttons[index]["icon"],
              buttons[index]["text"],
              buttons[index]["color"],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderButton(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 6),
          Text(text, style: AppTextStyle.bold16()),
        ],
      ),
    );
  }

  Widget _buildSchedule(DateTime dateValue) {
    // FIX 1: Updated mock data map keys to 2026 to match today's date
    final Map<String, List<Map<String, String>>> schedules = {
      "2026-05-18": [
        {
          "time": "07:00 - 07:45",
          "subject": "Japan",
          "teacher": "Floyd Miles",
          "duration": "15 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
      ],
      "2026-05-20": [
        {
          "time": "07:00 - 07:45",
          "subject": "Physics",
          "teacher": "Michael Johnson",
          "duration": "15 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Chemistry",
          "teacher": "Emma Brown",
          "duration": "10 min",
        },
      ],
    };

    String dateKey =
        "${dateValue.year}-${dateValue.month.toString().padLeft(2, '0')}-${dateValue.day.toString().padLeft(2, '0')}";

    List<Map<String, String>> selectedSchedule = schedules[dateKey] ?? [];

    // FIX 2: Added a safe empty state widget using SliverToBoxAdapter inside CustomScrollView
    if (selectedSchedule.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Text(
              "No classes scheduled for this date",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: EdgeInsets.only(
              bottom: index == selectedSchedule.length - 1 ? 0 : 10,
            ),
            child: ScheduleCardWidget(
              time: selectedSchedule[index]["time"]!,
              subject: selectedSchedule[index]["subject"]!,
              teacher: selectedSchedule[index]["teacher"]!,
              duration: selectedSchedule[index]["duration"]!,
              onTap: () {
                _navigateAndDisplaySelection(
                  context,
                  index: index,
                  titleName: selectedSchedule[index]["subject"]!,
                  time: selectedSchedule[index]["time"]!,
                  teacher: selectedSchedule[index]["teacher"]!,
                  data: dateKey,
                );
              },
            ),
          ),
          childCount: selectedSchedule.length,
        ),
      ),
    );
  }
}
