import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wow/core/constants/app/padding_constants.dart';
import 'package:wow/core/extensions/context/theme.dart';
import 'package:wow/core/extensions/theme/locale.dart';
import 'package:wow/core/manager/language/language_manager.dart';
import 'package:wow/core/manager/language/locale_keys.g.dart';
import 'package:wow/core/manager/notifier/notifiers/bluetooth_notifier.dart';
import 'package:wow/core/manager/notifier/notifiers/theme_notifier.dart';
import 'package:wow/core/manager/notifier/notifiers/wifi_notifier.dart';

part 'settings_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeNotifier get _themeModeNotifier => Provider.of<ThemeNotifier>(context);
  WifiNotifier get _wifiNotifier => Provider.of<WifiNotifier>(context);
  BluetoothNotifier get _bluetoothNotifier =>
      Provider.of<BluetoothNotifier>(context);

  bool _securityWall = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildGeneralSection(_themeModeNotifier),
        const Divider(),
        _networkSection,
        const Divider(),
        _additionSection,
      ],
    );
  }

  _SettingsSection get _additionSection {
    return _SettingsSection(
      children: <Widget>[
        _SettingsListTile(
          title: LocaleKeys.settings_help_and_feedback.tr(),
          subtitle: LocaleKeys.settings_help_and_feedback_subtitle.tr(),
          icon: FluentIcons.question_24_regular,
          onTap: () {},
        ),
        _SettingsListTile(
          title: LocaleKeys.settings_about.tr(),
          icon: FluentIcons.info_24_regular,
        ),
      ],
    );
  }

  _SettingsSection get _networkSection {
    return _SettingsSection(
      title: LocaleKeys.settings_network.tr(),
      children: <Widget>[
        _SettingsSwitchListTile(
          value: _wifiNotifier.wifi,
          title: LocaleKeys.settings_wifi.tr(),
          icon: FluentIcons.wifi_1_24_regular,
          onTap: _wifiNotifier.changeWifi,
        ),
        _SettingsSwitchListTile(
          value: _bluetoothNotifier.bluetooth,
          title: LocaleKeys.settings_bluetooth.tr(),
          icon: FluentIcons.bluetooth_24_regular,
          onTap: _bluetoothNotifier.changeBluetooth,
        ),
        _SettingsListTile(
          title: LocaleKeys.settings_vpn.tr(),
          subtitle: LocaleKeys.settings_vpn_subtitle.tr(),
          isBadge: true,
          badgeText: '1',
          icon: FluentIcons.key_24_regular,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return _VPNOptionsDialog();
              },
            );
          },
        ),
      ],
    );
  }

  _SettingsSection _buildGeneralSection(ThemeNotifier themeModeProvider) {
    return _SettingsSection(
      title: LocaleKeys.settings_general.tr(),
      children: <Widget>[
        _SettingsListTile(
          title: LocaleKeys.settings_theme_mode.tr(),
          icon: FluentIcons.dark_theme_24_regular,
          subtitle: themeModeProvider.currentThemeMode.locale.tr(),
          onTap: () {
            final dialog = showDialog(
              context: context,
              builder: (context) => _ChangeThemeModeDialog(
                currentMode: themeModeProvider.currentThemeMode,
              ),
            );

            dialog.then((value) {
              if (value != null) {
                themeModeProvider.changeThemeMode(value);
              }
            });
          },
        ),
        _SettingsListTile(
          title: LocaleKeys.settings_notification_type.tr(),
          icon: FluentIcons.alert_24_regular,
          onTap: () {},
        ),
        _SettingsSwitchListTile(
          title: LocaleKeys.settings_security_wall.tr(),
          icon: FluentIcons.shield_24_regular,
          value: _securityWall,
          onTap: (value) {
            final dialog = showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const _SecurityWallDialog();
              },
            );

            dialog.then((value) {
              if (value!) {
                setState(() {
                  _securityWall = !_securityWall;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        LocaleKeys.settings_security_wall_status.tr(
                          args: [
                            _securityWall
                                ? LocaleKeys.opened.tr()
                                : LocaleKeys.closed.tr(),
                          ],
                        ),
                      ),
                      action: SnackBarAction(
                        label: LocaleKeys.ok.tr(),
                        onPressed: () {},
                      ),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                });
              }
            });
          },
        ),
        _SettingsListTile(
          title: LocaleKeys.settings_language.tr(),
          icon: FluentIcons.local_language_24_regular,
          subtitle: context.locale.toString().tr(),
          onTap: () {
            final dialog = showDialog<Locale>(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Text(LocaleKeys.settings_select_language.tr()),
                  children: <Widget>[
                    ...LanguageManager.instance.supportedLocales
                        .map((language) {
                      return SimpleDialogOption(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              language.toString().tr(),
                              style: context.textTheme.bodyLarge,
                            ),
                            if (context.locale.languageCode ==
                                language.languageCode)
                              const Icon(FluentIcons.checkmark_24_regular),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(language);
                        },
                      );
                    }),
                    Padding(
                      padding: PaddingConstants.horizontalMedium,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(null);
                            },
                            child: Text(LocaleKeys.cancel.tr()),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );

            dialog.then((value) async {
              if (value != null) {
                await context.setLocale(value);
              }
            });
          },
        ),
      ],
    );
  }
}
