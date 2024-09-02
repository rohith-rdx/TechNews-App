import 'package:flutter/material.dart';
import 'package:technews/pages/home.dart';
import 'package:technews/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Appcolors.primary,
      ),
      home: Home(),
    );
  }
}
