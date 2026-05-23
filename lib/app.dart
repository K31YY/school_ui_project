import 'package:flutter/material.dart';
import 'package:flutter_school_app/config/theme/theme_style.dart';
import 'package:flutter_school_app/screens/dashboard_screen.dart';
import 'package:flutter_school_app/screens/home_screen.dart';
import 'package:flutter_school_app/screens/home_small.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: DashboardScreen(),
      routes: {
        '/home1': (context) => HomeScreen(),
        '/home2': (context) => HomeSmall(),
      },
    );
  }
}
