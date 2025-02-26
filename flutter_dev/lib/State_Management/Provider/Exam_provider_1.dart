import 'package:flutter/foundation.dart';

class Example_One_Provider with ChangeNotifier {
  double Value = 1.0;
  double get value => Value;

  void set_Value(double val) {
    Value = val;
    notifyListeners();
  }
}
