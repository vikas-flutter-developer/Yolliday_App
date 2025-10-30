//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolliday_app/main_shell.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFD95555);
  static const Color primaryOrange = Color(0xFFE8914F);
  static const Color textBlack = Color(0xFF333333);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color inactiveGrey = Color(0xFFBDBDBD);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color lightGreyBackground = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color primaryOrange2 = Color(0xFFDF5532);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'yolliday_app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: AppColors.backgroundWhite,
            primaryColor: AppColors.primaryOrange2,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryOrange2,
              primary: AppColors.primaryOrange2,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.backgroundWhite,
              foregroundColor: AppColors.textBlack,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontFamily: 'Roboto',
                color: AppColors.textBlack,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            tabBarTheme: TabBarTheme(
              labelColor: AppColors.primaryOrange2,
              unselectedLabelColor: AppColors.textGrey,
              indicatorColor: AppColors.primaryOrange2,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.backgroundWhite,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryOrange2,
              unselectedItemColor: AppColors.inactiveGrey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 8.0,
              selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Roboto',
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          home: child,
        );
      },
      child: const MainShell(),
    );
  }
}
