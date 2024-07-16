import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceRed,
    required this.red,
    required this.onRed,
    required this.redContainer,
    required this.onRedContainer,
    required this.sourceBrown,
    required this.brown,
    required this.onBrown,
    required this.brownContainer,
    required this.onBrownContainer,
    required this.sourceBlue,
    required this.blue,
    required this.onBlue,
    required this.blueContainer,
    required this.onBlueContainer,
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
    required this.sourcePurple,
    required this.purple,
    required this.onPurple,
    required this.purpleContainer,
    required this.onPurpleContainer,
  });

  final Color? sourceRed;
  final Color? red;
  final Color? onRed;
  final Color? redContainer;
  final Color? onRedContainer;
  final Color? sourceBrown;
  final Color? brown;
  final Color? onBrown;
  final Color? brownContainer;
  final Color? onBrownContainer;
  final Color? sourceBlue;
  final Color? blue;
  final Color? onBlue;
  final Color? blueContainer;
  final Color? onBlueContainer;
  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;
  final Color? sourcePurple;
  final Color? purple;
  final Color? onPurple;
  final Color? purpleContainer;
  final Color? onPurpleContainer;

  @override
  CustomColors copyWith({
    Color? sourceRed,
    Color? red,
    Color? onRed,
    Color? redContainer,
    Color? onRedContainer,
    Color? sourceBrown,
    Color? brown,
    Color? onBrown,
    Color? brownContainer,
    Color? onBrownContainer,
    Color? sourceBlue,
    Color? blue,
    Color? onBlue,
    Color? blueContainer,
    Color? onBlueContainer,
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
    Color? sourcePurple,
    Color? purple,
    Color? onPurple,
    Color? purpleContainer,
    Color? onPurpleContainer,
  }) {
    return CustomColors(
      sourceRed: sourceRed ?? this.sourceRed,
      red: red ?? this.red,
      onRed: onRed ?? this.onRed,
      redContainer: redContainer ?? this.redContainer,
      onRedContainer: onRedContainer ?? this.onRedContainer,
      sourceBrown: sourceBrown ?? this.sourceBrown,
      brown: brown ?? this.brown,
      onBrown: onBrown ?? this.onBrown,
      brownContainer: brownContainer ?? this.brownContainer,
      onBrownContainer: onBrownContainer ?? this.onBrownContainer,
      sourceBlue: sourceBlue ?? this.sourceBlue,
      blue: blue ?? this.blue,
      onBlue: onBlue ?? this.onBlue,
      blueContainer: blueContainer ?? this.blueContainer,
      onBlueContainer: onBlueContainer ?? this.onBlueContainer,
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
      sourcePurple: sourcePurple ?? this.sourcePurple,
      purple: purple ?? this.purple,
      onPurple: onPurple ?? this.onPurple,
      purpleContainer: purpleContainer ?? this.purpleContainer,
      onPurpleContainer: onPurpleContainer ?? this.onPurpleContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceRed: Color.lerp(sourceRed, other.sourceRed, t),
      red: Color.lerp(red, other.red, t),
      onRed: Color.lerp(onRed, other.onRed, t),
      redContainer: Color.lerp(redContainer, other.redContainer, t),
      onRedContainer: Color.lerp(onRedContainer, other.onRedContainer, t),
      sourceBrown: Color.lerp(sourceBrown, other.sourceBrown, t),
      brown: Color.lerp(brown, other.brown, t),
      onBrown: Color.lerp(onBrown, other.onBrown, t),
      brownContainer: Color.lerp(brownContainer, other.brownContainer, t),
      onBrownContainer: Color.lerp(onBrownContainer, other.onBrownContainer, t),
      sourceBlue: Color.lerp(sourceBlue, other.sourceBlue, t),
      blue: Color.lerp(blue, other.blue, t),
      onBlue: Color.lerp(onBlue, other.onBlue, t),
      blueContainer: Color.lerp(blueContainer, other.blueContainer, t),
      onBlueContainer: Color.lerp(onBlueContainer, other.onBlueContainer, t),
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
      sourcePurple: Color.lerp(sourcePurple, other.sourcePurple, t),
      purple: Color.lerp(purple, other.purple, t),
      onPurple: Color.lerp(onPurple, other.onPurple, t),
      purpleContainer: Color.lerp(purpleContainer, other.purpleContainer, t),
      onPurpleContainer:
          Color.lerp(onPurpleContainer, other.onPurpleContainer, t),
    );
  }
}
