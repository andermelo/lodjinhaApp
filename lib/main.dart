import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/screen/AboutScreen.dart';
import 'package:lodjinha/screen/HomeScreen.dart';
import 'package:lodjinha/screen/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
     return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.light,
        primaryColor: LodjinhaColors.primaryColor,
        primaryColorLight: Colors.white,
        accentColor:LodjinhaColors.accentColor,
        appBarTheme: AppBarTheme(
          color: LodjinhaColors.primaryColor
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: LodjinhaColors.primaryColorDark),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.red),
          headline4: TextStyle(fontSize: 12.0,color: Colors.grey[400],decoration: TextDecoration.lineThrough),
          headline5: TextStyle(fontSize: 14.0,color:LodjinhaColors.primaryColorDark,fontWeight: FontWeight.w600,letterSpacing: -0.3),
          headline6: TextStyle(fontSize: 12.0,color:LodjinhaColors.primaryColorDark,fontWeight: FontWeight.w300,letterSpacing: -0.3),
          subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal,height: 1.3),
        ),
      ),
      title: LodjinhaStrings.appName,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AboutScreen.id: (context) => AboutScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
