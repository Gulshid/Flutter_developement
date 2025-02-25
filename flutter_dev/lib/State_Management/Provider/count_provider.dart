import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 40;
  int time_now = 0;
  int get count => _count;
  int get time => time_now;
  //function for set the count
  void set_count() {
    _count++;
    notifyListeners();
  }
}
