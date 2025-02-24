import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;

class to_do_model {
    List to_do = [];
  final _box = Hive.box('to do');

  void create_initial_data(){
    to_do = [
      ["Make Tutorial", false],
      ["Make Exercise ", false],
    ];
  }

  void load_data(){
    to_do=_box.get('to do List');
  }

  void update_data(){
    _box.put('to do List', to_do);
  }

}
