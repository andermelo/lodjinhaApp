
import 'package:lodjinha/model/BannerModel.dart';
import 'package:lodjinha/model/CategoryModel.dart';
import 'package:lodjinha/model/ProductModel.dart';
import 'package:lodjinha/networkApis/HttpProduct.dart';
import 'package:lodjinha/networkApis/httpBanner.dart';
import 'package:lodjinha/networkApis/httpCategory.dart';
import 'package:mobx/mobx.dart';

part 'HomeStore.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

  @observable
  ObservableList<BannerModel> listaBanner = new ObservableList<BannerModel>();

  @observable
  ObservableList<CategoryModel> listaCategoria = new ObservableList<CategoryModel>();
  
  @observable
  ObservableList<ProductModel> listaMaisVendido = new ObservableList<ProductModel>();
  
  @observable
  int current = 0;

  // Banner Home

  Future<ResBanner> bannerFetch() async {
    HttpBanner _httpBanner = new HttpBanner();
    return await _httpBanner.getBanners();
  }

  void listarBanners() {
    bannerFetch().then((onValue) {
      listaBanner = ObservableList.of(onValue.data);
    });
  }

  List<String> getListImages(){
    List<String> list;
    bannerFetch().then((onValue) {
      listaBanner = ObservableList.of(onValue.data);
        for (var i = 0; i < listaBanner.length; i++) {
        list.add(listaBanner[i].linkUrl);
      }
      return list;
    });
  }

  //categorias

  Future<ResCategory> categoryFetch() async {
    HttpCategory _httpCategory = new HttpCategory();
    return await _httpCategory.getCategory();
  }
  
  void listarCategory() {
    categoryFetch().then((onValue) {
      listaCategoria = ObservableList.of(onValue.data);

    });
  }

  // Mais vendidos

  Future<ResProductBest> bestSellerFetch() async {
    HttpProduct _httpProduct = new HttpProduct();
    return await _httpProduct.getBestSeller();
  }
  
  void listarBestSeller() {
    bestSellerFetch().then((onValue) {
      listaMaisVendido = ObservableList.of(onValue.data);
    });
  }

}