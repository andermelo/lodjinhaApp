import 'package:flutter/material.dart';
import 'package:lodjinha/model/CategoryModel.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/presenter/ItemCategoryPresenter.dart';

class ItemCategoryScreen extends StatefulWidget {

  @override
  _ItemCategoryScreenState createState() => _ItemCategoryScreenState();
}

class _ItemCategoryScreenState extends State<ItemCategoryScreen> {

  final List<ProductModel> productList = new List<ProductModel>();
  final List<CategoryModel> categoryList = new List<CategoryModel>();
  ItemCategoryPresenter categoryPresenter = new ItemCategoryPresenter();
  CategoryModel category = new CategoryModel();

  

  @override
  void initState() {
    category = CategoryModel(id:1,des:"Descrição",urlImage:"urlImage");
    for (var i = 0; i < 6; i++) {
      productList.add(ProductModel(categoryModel: category,));
      categoryList.add(CategoryModel(id: 0,des:"Descrição", urlImage:"urlImage"));
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Name category")),
      body:categoryPresenter.LodjinhaListView(context, productList)
    );
  }
}