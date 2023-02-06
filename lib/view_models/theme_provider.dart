import 'package:flutter/cupertino.dart';


class DarkTheme extends ChangeNotifier {
  bool _dark = false;
  bool get dark => _dark;
  void change() {
    _dark = true;
    notifyListeners();
  }
}
