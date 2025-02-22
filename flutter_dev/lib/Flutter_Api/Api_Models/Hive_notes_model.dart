
import 'package:hive/hive.dart';
// part 'Hive_notes_model.g.dart';
@HiveType(typeId: 0)


class notes_1 {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;
  notes_1({required this.title, required this.description});
}

