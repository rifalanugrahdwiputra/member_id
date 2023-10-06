import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppThemes.appBarTheme,
    primarySwatch: AppThemes.primarySwatch,
    inputDecorationTheme: AppThemes.inputDecorationTheme,
    elevatedButtonTheme: AppThemes.elevatedButtonThemeData,
    outlinedButtonTheme: AppThemes.outlinedButtonThemeData,
    textButtonTheme: AppThemes.textButtonThemeData,
    tabBarTheme: AppThemes.tabBarTheme,
    fontFamily: "assets/fonts/Poppins.ttf",
  );

  static const MaterialColor primarySwatch = AppColors.primaryMaterial;

  static const AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: AppColors.primaryColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18.0,
    ),
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
    hintStyle: TextStyle(color: AppColors.blackColor),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    labelStyle: TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(
        width: 2.0,
        color: AppColors.primaryColor,
      ),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
      elevation: MaterialStateProperty.all(5.0),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16.0,
        ),
      ),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: AppColors.blackColor),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16.0,
        ),
      ),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );

  static const TabBarTheme tabBarTheme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelStyle: TextStyle(fontSize: 14.0),
    unselectedLabelColor: Colors.white,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
  );
}
