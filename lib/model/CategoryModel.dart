class CategoryModel {
  // "descricao": "string",
  //     "id": 0,
  //     "urlImagem": "string"

  int id;
  String des;
  String urlImage;

  CategoryModel({this.id, this.des, this.urlImage});

  CategoryModel.fromJson(Map json)
      : id = json['id'],
        des = json['descricao'],
        urlImage = json['urlImagem'];

  Map toJson(CategoryModel category) {
    return {
      'id': id,
      'descricao': des,
      'urlImagem': urlImage,
    };
  }
}

class ResCategory {
  List<CategoryModel> data;

  ResCategory({this.data});

  ResCategory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CategoryModel>();
      json['data'].forEach((v) {
        data.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    CategoryModel bannerModel;
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson(bannerModel)).toList();
    }
    return data;
  }
}
