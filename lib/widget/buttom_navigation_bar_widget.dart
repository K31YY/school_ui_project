import 'package:flutter/material.dart';
import 'package:flutter_school_app/config/theme/theme_style.dart';

class CustomBottomNavBar extends StatefulWidget {
  final void Function(int)? onTap;
  final int? selectedIndex;
  const CustomBottomNavBar({super.key, this.onTap, this.selectedIndex});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex ?? 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap!(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    List iconList = [
      Icons.home_filled,
      Icons.school,
      Icons.grid_view_rounded,
      Icons.chat,
      Icons.person,
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
            color: AppTheme.secondarySwatch[900],
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(35),
              right: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(iconList.length, (index) {
                  return _navBarIcon(iconList[index], index);
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _navBarIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        size: 28,
        color: _selectedIndex == index
            ? Colors.white
            : Colors.white.withValues(alpha: 0.5),
      ),
    );
  }
}
