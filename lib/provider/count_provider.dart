import 'package:flutter/cupertino.dart';

// provider 简单示例
class CountProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
