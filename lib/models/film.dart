import 'package:hive/hive.dart';

part 'film.g.dart';

@HiveType(typeId: 0)
class Film  extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imagePath;
  @HiveField(2)
  final String description;

  Film({
    required this.name,
    required this.imagePath,
    required this.description
  });
}
