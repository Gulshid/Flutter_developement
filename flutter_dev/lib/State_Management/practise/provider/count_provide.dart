import 'package:flutter/material.dart';

class Count_ with ChangeNotifier {
  int _incre = 0;
  int get incre => _incre;

  void set_co() {
    _incre++;
    notifyListeners();
  }
}
