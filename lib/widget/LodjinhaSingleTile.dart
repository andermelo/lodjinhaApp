import 'package:flutter/material.dart';
import 'LodjinhaInkWellOverley.dart';

class LodjinhaSingleTile extends StatelessWidget {
  const LodjinhaSingleTile({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return LodjinhaInkWellOverlay(
      openContainer: openContainer,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.black38,
             child: Center(
              child: Image.asset('assets/placeholder_image.png',width: 75,),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nome do produto com uma descrição grandona',style: Theme.of(context).textTheme.subtitle1,),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("De: 9999,99",style: Theme.of(context).textTheme.headline4),
                      Text("Por 9999,98",style: Theme.of(context).textTheme.headline3)
                    ]
                  )
                ],
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}