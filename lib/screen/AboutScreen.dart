import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/widget/LodjinhaTextLogo.dart';

class AboutScreen extends StatelessWidget {
  static const String id = "about_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Sobre")),
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Column(
              children:[
                LodjinhaTextLogo().widgetTextLogo(text: LodjinhaStrings.appName,color: LodjinhaColors.primaryColor),
              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text("Anderson Melo",style: Theme.of(context).textTheme.headline5,),
                SizedBox(height: 10.0,),
                Text("03/06/2020",style: Theme.of(context).textTheme.headline6,)
              ]
            )
          ],
        ),
      )
    );
  }
}