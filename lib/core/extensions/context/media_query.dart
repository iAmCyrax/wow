import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  double dynamicHeight(double value) => screenHeight * value;
  double dynamicWidth(double value) => screenWidth * value;
}