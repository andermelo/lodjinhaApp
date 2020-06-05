import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:html/parser.dart';
import 'package:lodjinha/screen/ItemCategoryscreen.dart';
import 'package:lodjinha/screen/ItemDetailScreen.dart';
import 'package:lodjinha/store/HomeStore.dart';
import 'package:lodjinha/widget/LodjinhaCategoryCard.dart';
import 'package:lodjinha/widget/LodjinhaOpenContainerWrapper.dart';
import 'package:lodjinha/widget/LodjinhaSingleTile.dart';

class HomePresenter {
  HomeStore _homeStore = new HomeStore();

  void loadSlider() {
    _homeStore.listarBanners();
  }

  void loadCategory() {
    _homeStore.listarCategory();
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }


  Widget imageSliders(BuildContext context) {

    _homeStore.listarBanners();

    return Observer(builder: (_){

         List<Widget> imageSliders = _homeStore.listaBanner
          .map((item) => Container(
                child: Container(
                  //margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                    children: <Widget>[
                      Image.network(item.linkUrl, fit: BoxFit.cover, width: 500.0,height: 330.0,),
                    ],
                  )),
                ),
              ))
          .toList();

          return Stack(
                children: <Widget>[
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        //autoPlay: true,
                        // enlargeCenterPage: true,
                        //aspectRatio: 2.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          _homeStore.current = index;
                        }
                    ),
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
                              color: _homeStore.current == index ? Color.fromRGBO(250, 250, 250, 0.9) : Color.fromRGBO(250, 250, 250, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  )
                ],
              );
              

    });

    
  }


  Widget lodjinhaListView(BuildContext context) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;
    _homeStore.listarBestSeller();
    return Observer(builder: (_) {
      if (_homeStore.listaMaisVendido.length > 0) {
        return ListView.builder(
          itemCount: _homeStore.listaMaisVendido.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: LodjinhaOpenContainerWrapper(
                transitionType: _transitionType,
                containerWhrapper: ItemDetailScreen(_homeStore.listaMaisVendido[index].id),
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return LodjinhaSingleTile(
                    openContainer: openContainer,
                    title: _homeStore.listaMaisVendido[index].name,
                    urlImg: _homeStore.listaMaisVendido[index].urlImage,
                    priceOf: _homeStore.listaMaisVendido[index].priceOf.toString(),
                    priceFor: _homeStore.listaMaisVendido[index].priceFor.toString(),);
                },
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget lodjinhaListViewCategory(BuildContext context) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;
    _homeStore.listarCategory();
    return Observer(builder: (_) {
      if (_homeStore.listaCategoria.length > 0) {
        return ListView.builder(
          itemCount: _homeStore.listaCategoria.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 4.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: LodjinhaOpenContainerWrapper(
                transitionType: _transitionType,
                containerWhrapper: ItemCategoryScreen(),
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return LodjinhaCategoryCard(
                    openContainer: openContainer,
                    subtitle: _homeStore.listaCategoria[index].des,
                    urlImg: _homeStore.listaCategoria[index].urlImage,
                    );
                },
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget detailImg(BuildContext context, int id){
    _homeStore.getProdutcId(id);
    return Observer(builder: (_){
      if(_homeStore.productForId != null){
        return CachedNetworkImage(
                imageUrl: _homeStore.productForId.urlImage,
                width: 75.0,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                );
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget detailTexts(BuildContext context, int id){
    _homeStore.getProdutcId(id);
    return Observer(builder: (_){
      if (_homeStore.productForId != null) {
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_homeStore.productForId.name,style: Theme.of(context).textTheme.headline2),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("De: " + _homeStore.productForId.priceOf.toString(),style: Theme.of(context).textTheme.headline4),
                      Text("Por " + _homeStore.productForId.priceFor.toString(),style: Theme.of(context).textTheme.headline3)
                    ]
                  ),
                  Divider(),
                  SizedBox(height: 20.0,),
                  Text("Descrição", style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(height: 35.0,),
                  Text(_parseHtmlString(_homeStore.productForId.des), style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 60.0,)
                ]
              );
      }else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  } 

}
