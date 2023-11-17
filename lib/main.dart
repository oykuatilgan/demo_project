import 'package:flutter/material.dart';
import 'package:flutter_demo_project/demo_app/main_app.dart';
import 'package:flutter_demo_project/demo_app/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: MainPage());
  }
}
