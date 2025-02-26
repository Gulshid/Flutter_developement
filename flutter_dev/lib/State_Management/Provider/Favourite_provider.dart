import 'package:flutter/foundation.dart';

class Favourite_app with ChangeNotifier {
  List<int> selected_item = [];

  List<int> get selected => selected_item;

  void add_item(int value) {
    selected.add(value);
    notifyListeners();
  }

  void remove_item(int value){
    selected.remove(value);
    notifyListeners();
  }
}
