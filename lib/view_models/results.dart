import 'package:flutter/cupertino.dart';

class ResultNotifier extends ChangeNotifier {
  int _count = 6;
  int get count => _count;
  void result() {
    _count++;
    notifyListeners();
  }
}
