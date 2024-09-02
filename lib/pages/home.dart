import 'package:flutter/material.dart';
import 'package:technews/utils/appbar.dart';
import 'package:technews/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.bgColor,
      appBar:  appbar(),
      body: SafeArea(
        
          child: Column(
        children: [],
      )),
    );
  }
}
