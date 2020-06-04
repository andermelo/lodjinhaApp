import 'package:flutter/material.dart';
import 'LodjinhaInkWellOverley.dart';

class LodjinhaCategoryCard extends StatelessWidget {
  const LodjinhaCategoryCard({
    this.openContainer,
    this.subtitle,
  });

  final VoidCallback openContainer;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return LodjinhaInkWellOverlay(
      openContainer: openContainer,
      // height: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.black38,
            //height: 150,
            child: Center(
              child: Image.asset('assets/placeholder_image.png',width: 100),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('descrição',style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}