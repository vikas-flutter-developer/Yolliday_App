// main_shell.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolliday_app/main.dart'; // Assumed to contain AppColors
import 'package:yolliday_app/pages/placeholder_page.dart';
import 'package:yolliday_app/pages/portfolio_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // State for page selection, managed here for app-wide persistence
  int _selectedIndex = 1;

  // The list of pages that will be shown in the body
  static const List<Widget> _pages = <Widget>[
    PlaceholderPage(title: 'Home'),
    PortfolioPage(),
    PlaceholderPage(title: 'Input'),
    PlaceholderPage(title: 'Profile'),
  ];

  // Helper data for the navigation bar items
  final List<Map<String, dynamic>> _navItems = [
    {'icon': 'home.svg', 'label': 'Home', 'index': 0},
    {'icon': 'portfolio.svg', 'label': 'Portfolio', 'index': 1},
    {'icon': 'input.svg', 'label': 'Input', 'index': 2},
    {'icon': 'profile.svg', 'label': 'Profile', 'index': 3},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.primaryOrange2;
    const Color inactiveColor = AppColors.inactiveGrey;

    return Scaffold(
      // Body switches pages based on _selectedIndex
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      // The persistent 60.h Custom Navigation Bar
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          width: 1.sw,
          height: 60.h, // Guarantees the 60.h height across all screens
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          // Custom Row replaces BottomNavigationBar to avoid padding issues
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.map((item) {
              return _buildCustomNavItem(
                item['icon'],
                item['label'],
                item['index'],
                activeColor,
                inactiveColor,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Builds the custom clickable item (InkWell structure)
  Widget _buildCustomNavItem(
      String iconName,
      String label,
      int index,
      Color activeColor,
      Color inactiveColor,
      ) {
    final bool isActive = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: SizedBox(
          height: 60.h, // Forces item height to match container height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Indicator line (2.h)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color: isActive ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 1.h), // Space (1.h)
              // Icon (20.h)
              SvgPicture.asset(
                'assets/icons/$iconName',
                colorFilter: ColorFilter.mode(
                  isActive ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(height: 1.h), // Space (1.h)
              // Text (10.sp height)
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: isActive ? activeColor : inactiveColor,
                ),
              ),
              // Final vertical padding to center content
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}