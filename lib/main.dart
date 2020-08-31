import 'package:HelpaEu/pages/cadastro.dart';
import 'package:HelpaEu/pages/home.dart';
import 'package:HelpaEu/pages/splash.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: grayMaterialColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/splash',
        routes: {
          '/': (context) => MyHomePage(title: "HelpaEu"),
          '/splash': (context) => Splash(),
        });
  }
}
