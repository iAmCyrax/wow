import 'package:flutter/material.dart';
import 'package:wow/core/manager/theme/custom_colors.dart';

class ThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeManager._init();

  ThemeData getTheme({bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: isDark ? darkColorScheme : lightColorScheme,
      fontFamily: 'Poppins',
      snackBarTheme: const SnackBarThemeData(
        width: 400,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      ),
      extensions: [
        isDark ? darkCustomColors : lightCustomColors,
      ],
    );
  }

  ColorScheme get lightColorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF006A60),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF74F8E5),
      onPrimaryContainer: Color(0xFF00201C),
      secondary: Color(0xFF4A635F),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFCCE8E2),
      onSecondaryContainer: Color(0xFF05201C),
      tertiary: Color(0xFF456179),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFCCE5FF),
      onTertiaryContainer: Color(0xFF001E31),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFAFDFB),
      onBackground: Color(0xFF191C1B),
      surface: Color(0xFFFAFDFB),
      onSurface: Color(0xFF191C1B),
      surfaceVariant: Color(0xFFDAE5E1),
      onSurfaceVariant: Color(0xFF3F4947),
      outline: Color(0xFF6F7977),
      onInverseSurface: Color(0xFFEFF1EF),
      inverseSurface: Color(0xFF2D3130),
      inversePrimary: Color(0xFF53DBC9),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF006A60),
      outlineVariant: Color(0xFFBEC9C6),
      scrim: Color(0xFF000000),
    );
  }

  ColorScheme get darkColorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF53DBC9),
      onPrimary: Color(0xFF003731),
      primaryContainer: Color(0xFF005048),
      onPrimaryContainer: Color(0xFF74F8E5),
      secondary: Color(0xFFB1CCC6),
      onSecondary: Color(0xFF1C3531),
      secondaryContainer: Color(0xFF334B47),
      onSecondaryContainer: Color(0xFFCCE8E2),
      tertiary: Color(0xFFADCAE6),
      onTertiary: Color(0xFF153349),
      tertiaryContainer: Color(0xFF2D4961),
      onTertiaryContainer: Color(0xFFCCE5FF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF191C1B),
      onBackground: Color(0xFFE0E3E1),
      surface: Color(0xFF191C1B),
      onSurface: Color(0xFFE0E3E1),
      surfaceVariant: Color(0xFF3F4947),
      onSurfaceVariant: Color(0xFFBEC9C6),
      outline: Color(0xFF899390),
      onInverseSurface: Color(0xFF191C1B),
      inverseSurface: Color(0xFFE0E3E1),
      inversePrimary: Color(0xFF006A60),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF53DBC9),
      outlineVariant: Color(0xFF3F4947),
      scrim: Color(0xFF000000),
    );
  }

  CustomColors get lightCustomColors {
    return const CustomColors(
      sourceRed: Color(0xFFF75558),
      red: Color(0xFFB5242E),
      onRed: Color(0xFFFFFFFF),
      redContainer: Color(0xFFFFDAD8),
      onRedContainer: Color(0xFF410006),
      sourceBrown: Color(0xFF4E5A04),
      brown: Color(0xFF576500),
      onBrown: Color(0xFFFFFFFF),
      brownContainer: Color(0xFFDAEC7A),
      onBrownContainer: Color(0xFF191E00),
      sourceBlue: Color(0xFF282549),
      blue: Color(0xFF5B53A8),
      onBlue: Color(0xFFFFFFFF),
      blueContainer: Color(0xFFE4DFFF),
      onBlueContainer: Color(0xFF160362),
      sourceGreen: Color(0xFF8EF86C),
      green: Color(0xFF1A6D00),
      onGreen: Color(0xFFFFFFFF),
      greenContainer: Color(0xFF91FB6F),
      onGreenContainer: Color(0xFF032100),
      sourcePurple: Color(0xFFC060CB),
      purple: Color(0xFF92369F),
      onPurple: Color(0xFFFFFFFF),
      purpleContainer: Color(0xFFFFD6FD),
      onPurpleContainer: Color(0xFF36003E),
    );
  }

  CustomColors get darkCustomColors {
    return const CustomColors(
      sourceRed: Color(0xFFF75558),
      red: Color(0xFFFFB3B0),
      onRed: Color(0xFF68000F),
      redContainer: Color(0xFF92021A),
      onRedContainer: Color(0xFFFFDAD8),
      sourceBrown: Color(0xFF4E5A04),
      brown: Color(0xFFBED061),
      onBrown: Color(0xFF2C3400),
      brownContainer: Color(0xFF414C00),
      onBrownContainer: Color(0xFFDAEC7A),
      sourceBlue: Color(0xFF282549),
      blue: Color(0xFFC6C0FF),
      onBlue: Color(0xFF2C2276),
      blueContainer: Color(0xFF433B8E),
      onBlueContainer: Color(0xFFE4DFFF),
      sourceGreen: Color(0xFF8EF86C),
      green: Color(0xFF76DE56),
      onGreen: Color(0xFF093900),
      greenContainer: Color(0xFF115300),
      onGreenContainer: Color(0xFF91FB6F),
      sourcePurple: Color(0xFFC060CB),
      purple: Color(0xFFFBABFF),
      onPurple: Color(0xFF580065),
      purpleContainer: Color(0xFF771885),
      onPurpleContainer: Color(0xFFFFD6FD),
    );
  }
}
