import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lodjinha/screen/ItemDetailScreen.dart';
import 'package:lodjinha/store/ItemCategoryStore.dart';
import 'package:lodjinha/widget/LodjinhaOpenContainerWrapper.dart';
import 'package:lodjinha/widget/LodjinhaSingleTile.dart';

class ItemCategoryPresenter {


  ItemCategoryStore _itemCategoryStore = new ItemCategoryStore();

  Widget LodjinhaListView(BuildContext context,  int id) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;
    _itemCategoryStore.getProdutcAll(id);
    return Observer(builder: (_){
      if(_itemCategoryStore.listaProdutosCat.length > 0){
        return ListView.builder(
          itemCount: _itemCategoryStore.listaProdutosCat.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: LodjinhaOpenContainerWrapper(
                transitionType: _transitionType,
                containerWhrapper: ItemDetailScreen(_itemCategoryStore.listaProdutosCat[index].id),
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return LodjinhaSingleTile(
                    openContainer: openContainer,
                    title: _itemCategoryStore.listaProdutosCat[index].name,
                    urlImg: _itemCategoryStore.listaProdutosCat[index].urlImage,
                    priceOf: _itemCategoryStore.listaProdutosCat[index].priceOf.toString(),
                    priceFor: _itemCategoryStore.listaProdutosCat[index].priceFor.toString(),
                    );
                },
              ),
            );
          },
        );
      }else{
         return Center(
          child: CircularProgressIndicator(
          ),
        );
      }
    });
  }
  
}