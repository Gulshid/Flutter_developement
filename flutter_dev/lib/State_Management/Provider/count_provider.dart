// import 'dart:ffi';

import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 40;
  final time_now = DateTime.now();
  int get count => _count;
  DateTime get time=>time_now;
  //function for set the count
  void set_count() {
    _count++;
    DateTime;
    notifyListeners();
  }
}
