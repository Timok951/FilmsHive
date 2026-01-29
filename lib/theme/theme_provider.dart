import 'package:flutter/material.dart';
import 'package:hive_app/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

    Future<void> toggleTheme() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? theme = await prefs.getBool("theme");
    print(theme);

    if(theme == false){
      themeData = darkmode;
      await prefs.setBool("theme", true);
      bool? theme = await prefs.getBool("theme");
      print("Getting Theme $theme");


    }
    else if (theme == true){
      themeData = lightMode;
      await prefs.setBool("theme", false);
      bool? theme = await prefs.getBool("theme");
      print("Getting Theme $theme");
    }
    else{
      print("theme was not initialized");

    }
  }

  Future<void> OnStartup() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? theme = await prefs.getBool("theme");
    
    if(theme == true){
      themeData = darkmode;
      print("on startup $theme");
    }
    else if (theme == false){
      themeData = lightMode;
      print("on startup $theme");
      prefs.setBool("theme", false);
    }
    else{
      print("theme was not initialized");
    }
  }
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
}