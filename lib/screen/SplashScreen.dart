import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/widget/LodjinhaTextLogo.dart';
import 'dart:async';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 2), () {
      // Navigator.pushNamed(context, LoginScreen.id);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(35.0),
        color: Colors.white,
        child: Center(
          child: LodjinhaTextLogo().widgetTextLogo(text: LodjinhaStrings.appName, color: LodjinhaColors.primaryColor),
        ),
      )
    );
  }
}