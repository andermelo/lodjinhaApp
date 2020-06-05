import 'dart:convert';

import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/model/CategoryModel.dart';
import 'package:lodjinha/networkApis/genereciHttpRequest.dart';

class HttpCategory {
  HttpCategory();

  String _url = LodjinhaStrings.Link_web_api_default;

  get http => null;

  Future<ResCategory> getCategory() async {
    ResCategory resultados;
    _url += "/categoria";

    GenericHttpRequest httpRequest = new GenericHttpRequest();
    httpRequest.setUrl(_url);

    var result = await httpRequest.invokeGetIterable();
    if (result.code == 200) {
      // Iterable map = result.body;
      // var map = result.body;
      Map<String, dynamic> map = result.body;
      //List<dynamic> data = map["data"];
      resultados = ResCategory.fromJson(map);
    }

    return resultados;
  }

  
}
