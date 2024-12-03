import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/screens/LandingPage.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          hintColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: LandingPage(),
    );
  }
}
