import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/presenter/HomePresenter.dart';

class ItemDetailScreen extends StatelessWidget {
  ItemDetailScreen(this.id);
  final int id;

  HomePresenter _homePresenter = new HomePresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned:true,
            flexibleSpace: FlexibleSpaceBar(
              //title:Text("Produto nome"),
              background: _homePresenter.detailImg(context,id),
            )
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _homePresenter.detailTexts(context, id),
            )
          )
        ] ,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: LodjinhaColors.primaryColor,
          child: Icon(Icons.check),
          onPressed: ()=> _showMyDialog(context)
        )
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: false,
        // title: Text(''),
        content: SingleChildScrollView(
          padding: EdgeInsets.only(top:22.0),
          child: ListBody(
            children: <Widget>[
              Text('Produto Reservado com sucesso',style: TextStyle(color:Colors.grey,fontSize: 16.0,fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok',style: TextStyle(color:LodjinhaColors.primaryColor)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
