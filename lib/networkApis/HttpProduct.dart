import 'package:lodjinha/constant/LodjinhaStrings.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/networkApis/genereciHttpRequest.dart';

class HttpProduct {
  HttpProduct();

  String _url = LodjinhaStrings.Link_web_api_default;

  get http => null;

  Future<ResProductBest> getBestSeller() async {
    ResProductBest resultados;
    _url += "/produto/maisvendidos";

    GenericHttpRequest httpRequest = new GenericHttpRequest();
    httpRequest.setUrl(_url);

    var result = await httpRequest.invokeGetIterable();
    if (result.code == 200) {
      // Iterable map = result.body;
      // var map = result.body;
      Map<String, dynamic> map = result.body;
      //List<dynamic> data = map["data"];
      resultados = ResProductBest.fromJson(map);
    }

    return resultados;
  }

  Future<ProductModel> getProductId(int id) async {
    ProductModel resultados;
    _url += "/produto/$id";

    GenericHttpRequest httpRequest = new GenericHttpRequest();
    httpRequest.setUrl(_url);

    var result = await httpRequest.invokeGetIterable();
    if (result.code == 200) {
      // Iterable map = result.body;
      // var map = result.body;
      Map<String, dynamic> map = result.body;
      //List<dynamic> data = map["data"];
      resultados = ProductModel.fromJson(map);
    }

    return resultados;
  }

  Future<ResProduct> getProductAll() async {
    ResProduct resultados;
    _url += "/produto";

    GenericHttpRequest httpRequest = new GenericHttpRequest();
    httpRequest.setUrl(_url);

    var result = await httpRequest.invokeGetIterable();
    if (result.code == 200) {
      // Iterable map = result.body;
      // var map = result.body;
      Map<String, dynamic> map = result.body;
      //List<dynamic> data = map["data"];
      resultados = ResProduct.fromJson(map);
    }

    return resultados;
  }

  
}