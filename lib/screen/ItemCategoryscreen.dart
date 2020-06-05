import 'package:flutter/material.dart';
import 'package:lodjinha/presenter/ItemCategoryPresenter.dart';

class ItemCategoryScreen extends StatefulWidget {

  ItemCategoryScreen(this.id, this.nameCat);
  final int id;
  final String nameCat;

  @override
  _ItemCategoryScreenState createState() => _ItemCategoryScreenState();
}

class _ItemCategoryScreenState extends State<ItemCategoryScreen> {

  ItemCategoryPresenter categoryPresenter = new ItemCategoryPresenter();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.nameCat)),
      body:categoryPresenter.LodjinhaListView(context, widget.id)
    );
  }
}