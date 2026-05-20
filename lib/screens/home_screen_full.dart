import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';
import 'package:flutter_first_project/core/string_con.dart';
import 'package:flutter_first_project/screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('${result[0]}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // colors: [Color(0xFF6A11CB), AppTheme.secondarySwatch],
            colors: [AppTheme.primarySwatch, AppTheme.secondarySwatch],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(SASTRA_DIGITAL_SOLUTION),
              radius: 85,
            ),

            const Text(
              'Welcome to Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            Column(
              children: [
                _buildNavButton(
                  context,
                  icon: Icons.home,
                  label: 'Go to Home Screen 1',
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen(),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(height: 25),
                _buildNavButton(
                  context,
                  icon: Icons.explore,
                  label: 'Go to Home Screen 2',
                  onPressed: () {
                    Navigator.pushNamed(context, '/home2');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.secondarySwatch,
        // foregroundColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
      ),
      icon: Icon(icon, color: AppTheme.secondarySwatch),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
