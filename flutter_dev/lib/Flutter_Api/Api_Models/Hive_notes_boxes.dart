import 'package:flutter_dev/Flutter_Api/Api_Models/Hive_notes_model.dart';
import 'package:hive/hive.dart';

class boxes{
  static Box<notes_1> getData()=>Hive.box<notes_1>('notes');
}