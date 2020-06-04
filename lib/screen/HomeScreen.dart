import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/model/CategoryModel.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/presenter/HomePresenter.dart';
import 'package:lodjinha/widget/LodjinhaDrawer.dart';
import 'package:lodjinha/widget/LodjinhaTextLogo.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
];

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  final List<ProductModel> productList = new List<ProductModel>();
  final List<CategoryModel> categoryList = new List<CategoryModel>();
  HomePresenter _homePresenter = new HomePresenter();
  CategoryModel category = new CategoryModel();

  @override
  void initState() {
    category = CategoryModel(id: 1, des: "Descrição", urlImage: "urlImage");
    for (var i = 0; i < 6; i++) {
      productList.add(ProductModel(
        categoryModel: category,
      ));
      categoryList
          .add(CategoryModel(id: 0, des: "Descrição", urlImage: "urlImage"));
    }
    super.initState();
  }

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
              child: Stack(
                children: <Widget>[
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        //autoPlay: true,
                        // enlargeCenterPage: true,
                        //aspectRatio: 2.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                  ),
                  Container(
                    height: 220.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      SizedBox(height:10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageSliders.map((url) {
                          int index = imageSliders.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? Color.fromRGBO(250, 250, 250, 0.9) : Color.fromRGBO(250, 250, 250, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  )
                ],
              ),
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
              height: 150.0,
              child: _homePresenter.LodjinhaListViewCategory(
                  context, categoryList),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Mais vendidos",
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            _homePresenter.LodjinhaListView(context, productList)
          ],
        )),
      ),
    );
  }
}

List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            //margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
              ],
            )),
          ),
        ))
    .toList();
