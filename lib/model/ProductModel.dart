import 'package:lodjinha/model/CategoryModel.dart';

class ProductModel {
  CategoryModel categoryModel;
  String des;
  int id;
  String name;
  int priceOf;
  double priceFor;
  String urlImage;

ProductModel({
  this.categoryModel,
  this.des,
  this.id,
  this.name,
  this.priceOf,
  this.priceFor,
  this.urlImage
});

ProductModel.fromJson(Map json)
      : id = json['id'],
        des = json['descricao'],
        categoryModel = json['categoria'] != null ? new CategoryModel.fromJson(json['categoria']) : null,
        name = json['nome'],
        priceOf = json['precoDe'],
        priceFor = json['precoPor'],
        urlImage = json['urlImagem'];

        Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryModel != null) {
      data['categoria'] = this.categoryModel.toJson(categoryModel);
    }
    data['descricao'] = this.des;
    data['id'] = this.id;
    data['nome'] = this.name;
    data['precoDe'] = this.priceOf;
    data['precoPor'] = this.priceFor;
    data['urlImagem'] = this.urlImage;

    return data;
  }

}

class ResProduct {
  List<ProductModel> data;
  int offset;
  int total;
  
  ResProduct({this.data, this.offset, this.total});

  ResProduct.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ProductModel>();
      json['data'].forEach((v) {
        data.add(new ProductModel.fromJson(v));
      });
    }
    offset = json['offset'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['total'] = this.total;
    return data;
  }
}

class ResProductBest {
  List<ProductModel> data;
  
  ResProductBest({this.data});

  ResProductBest.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ProductModel>();
      json['data'].forEach((v) {
        data.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



