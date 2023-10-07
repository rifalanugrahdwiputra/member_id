import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blueAccentColor = Color(0xFF50A6C7);
  static const Color primaryColor = Color(0xFF18284C);
  static const Color cardColor = Color(0xFF1E3364);
  static const Color indicatorColor = Color(0xFFF7D18E);
  static const Color disableIndicatorColor = Color(0xFF2E486A);
  static const Color starColor = Color(0xFFF8D956);
  static const Color shareColor = Color(0xFF4694E8);
  static const Color percentEnableColor = Color(0xFF90C388);
  static const Color percentDisableColor = Color(0xFFD67976);
  static const Color trueQuestionColor = Color(0xFF547E63);
  static const Color falseQuestionColor = Color(0xFFB64741);

  static const Map<int, Color> colorMap = {
    50: Color(0xFF18284C),
    100: Color(0xFF18284C),
    200: Color(0xFF18284C),
    300: Color(0xFF18284C),
    400: Color(0xFF18284C),
    500: Color(colorPrimaryMaterial),
    600: Color(0xFF18284C),
    700: Color(0xFF18284C),
    800: Color(0xFF18284C),
    900: Color(0xFF18284C),
  };

  static const int colorPrimaryMaterial = 0xFF18284C;
  static const MaterialColor primaryMaterial =
      MaterialColor(colorPrimaryMaterial, colorMap);
}
