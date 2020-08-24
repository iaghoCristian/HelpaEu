import 'package:HelpaEu/pages/welcome.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Welcome();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: grayColor,
        child: Center(
          child: Container(
            width: 210,
            height: 210,
            child: Text(
              "Logo Aqui",
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.none),
            ),
          ),
        ));
  }
}
