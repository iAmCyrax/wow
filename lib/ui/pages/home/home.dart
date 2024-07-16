import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:wow/core/manager/language/locale_keys.g.dart';
import 'package:wow/ui/widgets/buttons/secondary_button.dart';
import 'package:wow/ui/widgets/buttons/tertiary_button.dart';

part 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshList,
      child: ListView(
        children: const <Widget>[
          _HomeCard(),
          _HomeCard(),
        ],
      ),
    );
  }

  Future<void> _refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
