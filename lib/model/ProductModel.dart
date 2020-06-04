// {
//   "data": [
//     {
//       "categoria": {
//         "descricao": "string",
//         "id": 0,
//         "urlImagem": "string"
//       },
//       "descricao": "string",
//       "id": 0,
//       "nome": "string",
//       "precoDe": 0,
//       "precoPor": 0,
//       "urlImagem": "string"
//     }
//   ],
//   "offset": 0,
//   "total": 0
// }

import 'package:lodjinha/model/CategoryModel.dart';

class ProductModel {
  CategoryModel categoryModel;
  String des;
  int id;
  String name;
  int priceOf;
  int priceFor;
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

}



