import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF5B4FB8);
  static const Color primaryButton = Color(0xFF005FF6);
  static const Color greenButton = Color(0xFF7EBF7C);
  static const Color lightGreenButton = Color(0xFF8DC96C);
  static const Color redAccent = Color.fromARGB(255, 233, 42, 28);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color black87 = Colors.black87;
  static const Color grey = Colors.grey;
  
  static Color greyWithOpacity(double opacity) => Colors.grey.withOpacity(opacity);
  static Color blackWithOpacity(double opacity) => Colors.black.withOpacity(opacity);
  static Color whiteWithOpacity(double opacity) => Colors.white.withOpacity(opacity);
}
