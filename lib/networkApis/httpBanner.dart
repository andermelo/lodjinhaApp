import 'dart:convert';

import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/model/BannerModel.dart';
import 'package:lodjinha/networkApis/genereciHttpRequest.dart';

class HttpBanner {
  HttpBanner();

  String _url = LodjinhaStrings.Link_web_api_default;

  get http => null;

  Future<ResBanner> getBanners() async {
    // List<BannerModel> resultados;
    ResBanner resultados;
    _url += "/banner";

    GenericHttpRequest httpRequest = new GenericHttpRequest();
    httpRequest.setUrl(_url);

    var result = await httpRequest.invokeGetIterable();
    if (result.code == 200) {
      // Iterable map = result.body;
      // var map = result.body;
      Map<String, dynamic> map = result.body;
      //List<dynamic> data = map["data"];
      resultados = ResBanner.fromJson(map);
    }

    return resultados;
  }

  
}
