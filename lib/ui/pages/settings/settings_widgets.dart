part of 'settings.dart';

class _SettingsSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const _SettingsSection({
    this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null)
          Padding(
            padding: PaddingConstants.allSmall,
            child: Text(
              title!,
              style: context.textTheme.titleMedium,
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final bool? isBadge;
  final String? badgeText;
  final VoidCallback? onTap;

  const _SettingsListTile({
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.isBadge,
    this.badgeText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: icon != null ? tileIcon : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget get tileIcon {
    if (isBadge != null) {
      return Badge(
        label: Text(badgeText!),
        child: Icon(icon),
      );
    } else {
      return Icon(icon);
    }
  }
}

class _SettingsSwitchListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function(bool)? onTap;
  final bool value;

  const _SettingsSwitchListTile({
    required this.value,
    required this.title,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      secondary: icon != null ? Icon(icon) : null,
      value: value,
      onChanged: onTap,
    );
  }
}

class _ChangeThemeModeDialog extends StatelessWidget {
  final ThemeMode currentMode;

  const _ChangeThemeModeDialog({required this.currentMode});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(LocaleKeys.settings_select_theme_mode.tr()),
      children: <Widget>[
        ...ThemeMode.values.map((themeMode) {
          return SimpleDialogOption(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  themeMode.locale.tr(),
                  style: context.textTheme.bodyLarge,
                ),
                if (themeMode == currentMode)
                  const Icon(FluentIcons.checkmark_24_regular)
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop(themeMode);
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
  }
}

class _VPNOptionsDialog extends StatefulWidget {
  @override
  State<_VPNOptionsDialog> createState() => _VPNOptionsDialogState();
}

class _VPNOptionsDialogState extends State<_VPNOptionsDialog> {
  bool _autoConnect = true;
  bool _saveLast = false;
  // ignore: prefer_final_fields
  bool _stayConnection = false;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.settings_vpn_options.tr()),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(FluentIcons.dismiss_24_regular),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(LocaleKeys.save.tr()),
              ),
            ],
          ),
          body: _SettingsSection(
            children: <Widget>[
              _SettingsSwitchListTile(
                value: _autoConnect,
                title: LocaleKeys.settings_vpn_auto_connect.tr(),
                onTap: (value) {
                  setState(() {
                    _autoConnect = value;
                  });
                },
              ),
              _SettingsSwitchListTile(
                value: _saveLast,
                title: LocaleKeys.settings_vpn_save_last.tr(),
                onTap: (value) {
                  setState(() {
                    _saveLast = value;
                  });
                },
              ),
              _SettingsSwitchListTile(
                value: _stayConnection,
                title: LocaleKeys.settings_vpn_stay_on_connection.tr(),
                onTap: null,
              ),
              const Divider(),
              _SettingsListTile(
                title: LocaleKeys.settings_about.tr(),
                subtitle: 'WOW VPN 0.0.0',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecurityWallDialog extends StatelessWidget {
  const _SecurityWallDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.settings_security_wall_toggle.tr()),
      content: Text(LocaleKeys.settings_security_wall_description.tr()),
      actions: <Widget>[
        FilledButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(LocaleKeys.open.tr()),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(LocaleKeys.cancel.tr()),
        ),
      ],
    );
  }
}
