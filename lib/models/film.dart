import 'package:hive/hive.dart';

part 'film.g.dart';

@HiveType(typeId: 0)
class Film extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String imagePath;
  @HiveField(2)
  String description;

  Film({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}
