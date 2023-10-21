import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });

  factory NoteModel.fromJson(jsonData) {
    return NoteModel(
        title: jsonData['title'],
        subtitle: jsonData['subtitle'],
        date: jsonData['date'],
        color: jsonData['color']);
  }

  /*NoteModel copyWithColor({
    int? color,
  }) {
    return NoteModel(
      title: title,
      subtitle: subtitle,
      date: date,
      color: color ?? this.color,
    );
  }*/
}