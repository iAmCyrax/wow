import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:wow/core/extensions/context/theme.dart';
import 'package:wow/core/manager/language/locale_keys.g.dart';
import 'package:wow/core/models/destination.dart';
import 'package:wow/ui/pages/home/home.dart';
import 'package:wow/ui/pages/saved/saved.dart';
import 'package:wow/ui/pages/settings/settings.dart';

part 'root_widgets.dart';

class WowRoot extends StatefulWidget {
  const WowRoot({super.key});

  @override
  State<WowRoot> createState() => _WowRootState();
}

class _WowRootState extends State<WowRoot> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _handleDestinationSelected(int selectedScreen) {
    setState(() {
      _currentIndex = selectedScreen;
      _scaffoldKey.currentState!.closeDrawer();
    });
  }

  final List<Destination> _destinations = <Destination>[
    Destination(
      label: LocaleKeys.destination_home,
      icon: const Icon(FluentIcons.home_24_regular),
      selectedIcon: const Icon(FluentIcons.home_24_filled),
      destinationContent: const HomeScreen(),
    ),
    Destination(
      label: LocaleKeys.destination_saved,
      icon: const Icon(FluentIcons.bookmark_24_regular),
      selectedIcon: const Icon(FluentIcons.bookmark_24_filled),
      destinationContent: const SavedScreen(),
    ),
    Destination(
      label: LocaleKeys.destination_settings,
      icon: const Badge(child: Icon(FluentIcons.settings_24_regular)),
      selectedIcon: const Icon(FluentIcons.settings_24_filled),
      destinationContent: const SettingsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(
        onDestinationSelected: _handleDestinationSelected,
        selectedIndex: _currentIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Wow',
              style: context.textTheme.titleSmall,
            ),
          ),
          ..._destinations.map((destination) {
            return NavigationDrawerDestination(
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              label: Text(destination.label.tr()),
            );
          }),
        ],
      ),
      appBar: AppBar(
        title: Text(_destinations[_currentIndex].label.tr()),
        leading: IconButton(
          onPressed: _openDrawer,
          icon: const Icon(FluentIcons.navigation_24_regular),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
      body: SafeArea(
        child: _destinations[_currentIndex].destinationContent,
      ),
      bottomNavigationBar: _destinations[_currentIndex].label.tr() !=
              LocaleKeys.destination_settings.tr()
          ? BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.compass_northwest_24_regular),
                    tooltip: LocaleKeys.bottom_bar_menu.tr(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.search_24_regular),
                    tooltip: LocaleKeys.bottom_bar_search.tr(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.draw_image_24_regular),
                    tooltip: LocaleKeys.bottom_bar_image.tr(),
                  ),
                ],
              ),
            )
          : null,
      floatingActionButton: _destinations[_currentIndex].label.tr() !=
              LocaleKeys.destination_settings.tr()
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  // barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(LocaleKeys.welcome.tr()),
                      content: Text(LocaleKeys.add_dialog_soon.tr()),
                      actions: <Widget>[
                        FilledButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(LocaleKeys.ok.tr()),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(LocaleKeys.help.tr()),
                        ),
                      ],
                    );
                  },
                );
              },
              elevation: 0.0,
              child: const Icon(FluentIcons.add_24_regular),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
