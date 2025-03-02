import 'package:flutter/material.dart';

class OpacityProvider with ChangeNotifier {
  double _variable = 1.0;
  double get variable => _variable;

  //function for opacity
  void set_Color(double varia) {
    _variable = varia;
    notifyListeners();
  }
}
