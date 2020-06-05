import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/networkApis/HttpProduct.dart';
import 'package:mobx/mobx.dart';

part 'ItemCategoryStore.g.dart';

class ItemCategoryStore = _ItemCategoryStore with _$ItemCategoryStore;

abstract class _ItemCategoryStore with Store{
  
  
  @observable
  ObservableList<ProductModel> listaProdutosCat = new ObservableList<ProductModel>();

  Future<ResProduct> productCatFetch() async {
    HttpProduct _httpProduct = new HttpProduct();
    return await _httpProduct.getProductAll();
  }
  
  void getProdutcAll(int id) {
    productCatFetch().then((onValue) {
     List<ProductModel> list = new List<ProductModel>();
      onValue.data.forEach((p) {
        if (p.categoryModel.id == id) {
          list.add(p);
        }
      });
     
     listaProdutosCat = ObservableList.of(list);
    
    });
  }

}