import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 215, 191, 121),
    cardTheme: CardTheme(
        shape: StadiumBorder(),
        color: Color.fromARGB(157, 215, 191, 121),
        elevation: 20,
        shadowColor: Color.fromARGB(253, 41, 36, 23)),
    textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 92, 82, 52),
              fontWeight: FontWeight.bold),
        ),
    appBarTheme: AppBarTheme(
        titleTextStyle:
            TextStyle(color: Color.fromARGB(255, 92, 82, 52), fontSize: 30),
        backgroundColor: Color.fromARGB(157, 215, 191, 121),
        centerTitle: true)

    //colorScheme: ColorScheme(background: Color.fromARGB(255, 230, 216, 174)),
    );

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 22, 34, 104),
  cardTheme: CardTheme(
      shape: StadiumBorder(),
      color: Color.fromARGB(162, 22, 34, 104),
      elevation: 20,
      shadowColor: Color.fromARGB(255, 8, 13, 40)),
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(162, 22, 34, 104),
      centerTitle: true,
      titleTextStyle:
          TextStyle(color: Color.fromARGB(255, 165, 190, 77), fontSize: 20)),
  textTheme: ThemeData.dark().textTheme.copyWith(
        titleMedium: TextStyle(
            color: Color.fromARGB(255, 165, 190, 77),
            fontWeight: FontWeight.bold),
      ),
);
