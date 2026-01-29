import 'package:flutter/material.dart';
import 'package:hive_app/models/film.dart';
import 'package:hive_app/pages/homepage.dart';
import 'package:hive_app/theme/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  
  //init Hive
  await Hive.initFlutter();
  //register adapter for own types of data
  Hive.registerAdapter(FilmAdapter());
  var filmBox = await Hive.openBox<Film>('Films');

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp()
  )
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData
      );
  }
}