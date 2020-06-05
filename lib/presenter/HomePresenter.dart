import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lodjinha/model/CategoryModel.dart';
import 'package:lodjinha/model/ProductModel.dart';
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
      if (_homeStore.listaCategoria.length > 0) {
        return ListView.builder(
          itemCount: _homeStore.listaCategoria.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: LodjinhaOpenContainerWrapper(
                transitionType: _transitionType,
                containerWhrapper: ItemDetailScreen(),
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return LodjinhaSingleTile(openContainer: openContainer);
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
}
