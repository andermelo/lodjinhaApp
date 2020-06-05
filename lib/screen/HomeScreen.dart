import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/presenter/HomePresenter.dart';
import 'package:lodjinha/widget/LodjinhaDrawer.dart';
import 'package:lodjinha/widget/LodjinhaTextLogo.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomePresenter _homePresenter = new HomePresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: LodjinhaTextLogo().widgetTextLogo(
              text: LodjinhaStrings.appName,
              fontSize: 18.0,
              color: Colors.white)),
      drawer: LodjinhaDrawer(context),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FractionallySizedBox(
              child: _homePresenter.imageSliders(context)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categorias",
                        style: Theme.of(context).textTheme.subtitle1),
                  ]),
            ),
            Divider(),
            Container(
              height: 160.0,
              child: _homePresenter.lodjinhaListViewCategory(context),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Mais vendidos",
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            _homePresenter.lodjinhaListView(context)
          ],
        )),
      ),
    );
  }
}


