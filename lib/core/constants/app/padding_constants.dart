import 'package:flutter/material.dart';

/// extra small: 4.0
/// small: 8.0
/// medium: 24.0
/// large: 32.0
/// extraLarge: 64.0
class PaddingConstants {
  static const double _extraSmallValue = 4.0;
  static const double _smallValue = 8.0;
  static const double _mediumAccentValue = 16.0;
  static const double _mediumValue = 24.0;
  static const double _largeValue = 32.0;
  static const double _extraLargeValue = 64.0;

  static const EdgeInsets allExtraSmall = EdgeInsets.all(_extraSmallValue);
  static const EdgeInsets allSmall = EdgeInsets.all(_smallValue);
  static const EdgeInsets allMediumAccent = EdgeInsets.all(_mediumAccentValue);
  static const EdgeInsets allMedium = EdgeInsets.all(_mediumValue);
  static const EdgeInsets allLarge = EdgeInsets.all(_largeValue);
  static const EdgeInsets allExtraLarge = EdgeInsets.all(_extraLargeValue);

  static const EdgeInsets verticalExtraSmall =
      EdgeInsets.symmetric(vertical: _extraSmallValue);
  static const EdgeInsets verticalSmall =
      EdgeInsets.symmetric(vertical: _smallValue);
  static const EdgeInsets verticalMediumAccent =
      EdgeInsets.symmetric(vertical: _mediumAccentValue);
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: _mediumValue);
  static const EdgeInsets verticalLarge =
      EdgeInsets.symmetric(vertical: _largeValue);
  static const EdgeInsets verticalExtraLarge =
      EdgeInsets.symmetric(vertical: _extraLargeValue);

  static const EdgeInsets horizontalExtraSmall =
      EdgeInsets.symmetric(horizontal: _extraSmallValue);
  static const EdgeInsets horizontalSmall =
      EdgeInsets.symmetric(horizontal: _smallValue);
  static const EdgeInsets horizontalMediumAccent =
      EdgeInsets.symmetric(horizontal: _mediumAccentValue);
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: _mediumValue);
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: _largeValue);
  static const EdgeInsets horizontalExtraLarge =
      EdgeInsets.symmetric(horizontal: _extraLargeValue);
}
