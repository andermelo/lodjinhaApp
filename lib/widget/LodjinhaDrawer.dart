import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/screen/AboutScreen.dart';
import 'package:lodjinha/screen/HomeScreen.dart';
import 'package:lodjinha/widget/LodjinhaTextLogo.dart';

Widget LodjinhaDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children:[Image.asset('assets/avatar_logo.png',fit: BoxFit.cover,width: 50,)]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children:[LodjinhaTextLogo().widgetTextLogo(text: LodjinhaStrings.appName,fontSize: 18.0,color: Colors.white),]
              )
            ],
          ),
          decoration: BoxDecoration(
            color: LodjinhaColors.primaryColor,
          ),
        ),
        ListTile(
          leading: Icon(Icons.home,color: LodjinhaColors.primaryColor,size: 40.0),
          title: Text('Home',style: Theme.of(context).textTheme.headline5,),
          onTap: ()=> Navigator.pushNamed(context, HomeScreen.id),
        ),
        ListTile(
          leading: Icon(Icons.loyalty,color: LodjinhaColors.primaryColor,size: 40.0),
          title: Text('Sobre o aplicativo',style: Theme.of(context).textTheme.headline5,),
          onTap: ()=> Navigator.pushNamed(context, AboutScreen.id),
        ),
        ListTile(
          leading: Icon(Icons.info_outline,color: LodjinhaColors.primaryColor,size: 40.0),
          title: Text('Main informações',style: Theme.of(context).textTheme.headline5,),
          onTap: () {
            showAboutDialog(
              context: context,
              applicationVersion: '1.0.0',
              //applicationIcon: LodjinhaTextLogo().widgetTextLogo(text: LodjinhaStrings.appName,fontSize: 35.0,color: LodjinhaColors.primaryColor),
              // applicationLegalese: "lalalala",
              );
            },
        ),
      ],
    ),
  );
}
