import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaColors.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:html/parser.dart';

class ItemDetailScreen extends StatelessWidget {
  //static const String id = 'item_detail_screen';

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }

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
              background: Image.asset('assets/placeholder_image.png',fit: BoxFit.cover,)
            )
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome do produto com uma descrição grandona",style: Theme.of(context).textTheme.headline2),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("De: 9999,99",style: Theme.of(context).textTheme.headline4),
                      Text("Por 9999,98",style: Theme.of(context).textTheme.headline3)
                    ]
                  ),
                  Divider(),
                  SizedBox(height: 20.0,),
                  Text("Descrição", style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(height: 35.0,),
                  Text(_parseHtmlString(LodjinhaStrings.textoTest), style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 60.0,)
                ]
              ),
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
