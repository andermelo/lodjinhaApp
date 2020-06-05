import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/screen/ItemDetailScreen.dart';
import 'package:lodjinha/widget/LodjinhaOpenContainerWrapper.dart';
import 'package:lodjinha/widget/LodjinhaSingleTile.dart';

class ItemCategoryPresenter {

  Widget LodjinhaListView(BuildContext context, List<ProductModel> productList) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    return ListView.builder(
      itemCount: productList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: LodjinhaOpenContainerWrapper(
            transitionType: _transitionType,
            containerWhrapper: ItemDetailScreen(1),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return LodjinhaSingleTile(openContainer: openContainer);
            },
          ),
        );
      },
    );
  }
  
}