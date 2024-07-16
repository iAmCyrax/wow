import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wow/core/manager/notifier/notifiers/bluetooth_notifier.dart';
import 'package:wow/core/manager/notifier/notifiers/theme_notifier.dart';
import 'package:wow/core/manager/notifier/notifiers/wifi_notifier.dart';

class NotifierManager {
  static NotifierManager? _instance;
  static NotifierManager get instance {
    _instance ??= NotifierManager._init();
    return _instance!;
  }

  NotifierManager._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => WifiNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => BluetoothNotifier(),
    ),
  ];
}
