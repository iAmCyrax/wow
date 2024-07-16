import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow/core/manager/language/language_manager.dart';

import 'package:wow/core/manager/notifier/notifier_manager.dart';
import 'package:wow/core/manager/notifier/notifiers/theme_notifier.dart';
import 'package:wow/core/manager/theme/theme_manager.dart';
import 'package:wow/ui/pages/root/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  EasyLocalization.logger.enableBuildModes = [];

  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'assets/locales',
      startLocale: LanguageManager.instance.tr,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: NotifierManager.instance.dependItems,
      builder: (context, child) {
        return MaterialApp(
          home: const WowRoot(),
          theme: ThemeManager.instance.getTheme(),
          darkTheme: ThemeManager.instance.getTheme(isDark: true),
          themeMode: context.watch<ThemeNotifier>().currentThemeMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
