import 'package:flutter/material.dart';

class CountP with ChangeNotifier {
  int _count = 0;
  int get count => _count;



  void set_value() {
    _count++;
    notifyListeners();
  }
}
