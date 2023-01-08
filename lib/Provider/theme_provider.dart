import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final appDarkTheme = ThemeData(

    primaryColorLight: Colors.black,
    secondaryHeaderColor: Colors.white,
    primaryColor: Colors.lightBlue[800],
    unselectedWidgetColor: Colors.white70,
    iconTheme: const IconThemeData(color: Colors.black54),
    scaffoldBackgroundColor: const Color.fromARGB(255, 17, 27, 37),

    fontFamily: 'Light',
    brightness: Brightness.dark,
    dividerColor: Colors.black26,
    cardColor: const Color.fromARGB(255, 34, 46, 58),
    canvasColor: const Color.fromARGB(255, 34, 46, 58),

      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontFamily: 'Medium', color: Colors.black),
        bodySmall: TextStyle(fontSize: 15, fontFamily: 'Light', color: Colors.white),
        labelSmall: TextStyle(fontSize: 13, fontFamily: 'Light', color: Colors.white54),
        titleSmall: TextStyle(fontSize: 12, fontFamily: 'Light', color: Colors.black),
      )
  );

  static final appLightTheme = ThemeData(

      primaryColorLight: Colors.white,
      secondaryHeaderColor: Colors.black,
      primaryColor: Colors.lightBlue[800],
      unselectedWidgetColor: Colors.black54,
      iconTheme: const IconThemeData(color: Colors.white70),
      scaffoldBackgroundColor: const Color.fromARGB(255, 241, 244, 248),

      fontFamily: 'Light',
      brightness: Brightness.light,
      cardColor: const Color.fromARGB(255, 239, 240, 244),
      canvasColor: const Color.fromARGB(255, 239, 240, 244),
      dividerColor: const Color.fromARGB(255, 225, 226, 230),

      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontFamily: 'Medium', color: Colors.white),
        bodySmall: TextStyle(fontSize: 15, fontFamily: 'Light', color: Colors.black),
        labelSmall: TextStyle(fontSize: 13, fontFamily: 'Light', color: Colors.black38),
        titleSmall: TextStyle(fontSize: 12, fontFamily: 'Light', color: Colors.black),
      )
  );
}
