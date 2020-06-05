import 'package:flutter/material.dart';
import 'LodjinhaInkWellOverley.dart';

class LodjinhaCategoryCard extends StatelessWidget {
  const LodjinhaCategoryCard({
    this.openContainer,
    this.subtitle,
    this.urlImg
  });

  final VoidCallback openContainer;
  final String subtitle;
  final String urlImg;

  @override
  Widget build(BuildContext context) {
    return LodjinhaInkWellOverlay(
      openContainer: openContainer,
      // height: 225,
      width: 130.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.black38,
            //height: 150,
            child: Center(
              child: urlImg != null ? Image.network(urlImg,width: 100, fit: BoxFit.fill,) 
              : Image.asset('assets/placeholder_image.png', width:100, fit: BoxFit.fill,),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Text(subtitle,style: Theme.of(context).textTheme.subtitle2)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}