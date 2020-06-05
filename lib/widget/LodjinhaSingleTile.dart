import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'LodjinhaInkWellOverley.dart';

class LodjinhaSingleTile extends StatelessWidget {
  const LodjinhaSingleTile({
    this.openContainer,
    this.title,
    this.urlImg,
    this.priceOf,
    this.priceFor});

  final VoidCallback openContainer;
  final String title;
  final String urlImg;
  final String priceOf;
  final String priceFor;

  @override
  Widget build(BuildContext context) {
    return LodjinhaInkWellOverlay(
      openContainer: openContainer,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.black38,
             child: Center(
              child: CachedNetworkImage(
                imageUrl: urlImg,
                width: 75.0,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,style: Theme.of(context).textTheme.subtitle1,),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("De: $priceOf",style: Theme.of(context).textTheme.headline4),
                      Text("Por $priceFor",style: Theme.of(context).textTheme.headline3)
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