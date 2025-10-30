import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolliday_app/main.dart';
import 'package:yolliday_app/pages/placeholder_page.dart';
import 'package:yolliday_app/pages/portfolio_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 1;

  static const List<Widget> _pages = <Widget>[
    PlaceholderPage(title: 'Home'),
    PortfolioPage(),
    PlaceholderPage(title: 'Input'),
    PlaceholderPage(title: 'Profile'),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': 'home_solid.svg',
      'label': 'Home',
      'index': 0,
      'iconWidth': 18.0.w,
      'iconHeight': 20.0.h
    },
    {
      'icon': 'portfolio_solid.svg',
      'label': 'Portfolio',
      'index': 1,
      'iconWidth': 24.0.w,
      'iconHeight': 24.0.h
    },
    {
      'icon': 'input_solid.svg',
      'label': 'Input',
      'index': 2,
      'iconWidth': 20.5.w,
      'iconHeight': 20.0.h
    },
    {
      'icon': 'profile_solid.svg',
      'label': 'Profile',
      'index': 3,
      'iconWidth': 16.0.w,
      'iconHeight': 16.0.h
    },
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          width: 1.sw,
          height: 60.h,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.map((item) {
              return _buildCustomNavItem(
                item['icon'],
                item['label'],
                item['index'],
                item['iconWidth'],
                item['iconHeight'],
                activeColor,
                inactiveColor,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomNavItem(
      String iconName,
      String label,
      int index,
      double iconWidth,
      double iconHeight,
      Color activeColor,
      Color inactiveColor,
      ) {
    final bool isActive = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: SizedBox(
          height: 60.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.h,
                width: 24.w,
                decoration: BoxDecoration(
                  color: isActive ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(1.r),
                ),
              ),
              SizedBox(height: 3.h),
              SvgPicture.asset(
                'assets/icons/$iconName',
                colorFilter: ColorFilter.mode(
                  isActive ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
                width: iconWidth,
                height: iconHeight,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? activeColor : inactiveColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}