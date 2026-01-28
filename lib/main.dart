import 'package:flutter/material.dart';
import 'package:hive_app/models/film.dart';
import 'package:hive_app/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  
  //init Hive
  await Hive.initFlutter();
  //register adapter for own types of data
  Hive.registerAdapter(FilmAdapter());
  var filmBox = await Hive.openBox<Film>('Films');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode _themeMode = ThemeMode.light;
  
  void _toggleTheme(){
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark: ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade100,
          brightness: Brightness.light,
          surface: Colors.grey.shade200
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade100,
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 34, 40, 49)
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}