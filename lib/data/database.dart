import 'package:hive/hive.dart';
import 'package:hive_app/models/film.dart';

class FilmDtabase {
  
  List<Film> filmsList = [];

  final _myBox = Hive.box("Films");

  //run if this first time
  void createInitialData(){
    filmsList = [Film(name: "Lain", imagePath: "/lib/img/lain.jpg", description: "expreiments with lain")];
  }
}