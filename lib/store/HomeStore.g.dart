// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$listaBannerAtom = Atom(name: '_HomeStore.listaBanner');

  @override
  ObservableList<BannerModel> get listaBanner {
    _$listaBannerAtom.reportRead();
    return super.listaBanner;
  }

  @override
  set listaBanner(ObservableList<BannerModel> value) {
    _$listaBannerAtom.reportWrite(value, super.listaBanner, () {
      super.listaBanner = value;
    });
  }

  final _$listaCategoriaAtom = Atom(name: '_HomeStore.listaCategoria');

  @override
  ObservableList<CategoryModel> get listaCategoria {
    _$listaCategoriaAtom.reportRead();
    return super.listaCategoria;
  }

  @override
  set listaCategoria(ObservableList<CategoryModel> value) {
    _$listaCategoriaAtom.reportWrite(value, super.listaCategoria, () {
      super.listaCategoria = value;
    });
  }

  final _$listaMaisVendidoAtom = Atom(name: '_HomeStore.listaMaisVendido');

  @override
  ObservableList<ProductModel> get listaMaisVendido {
    _$listaMaisVendidoAtom.reportRead();
    return super.listaMaisVendido;
  }

  @override
  set listaMaisVendido(ObservableList<ProductModel> value) {
    _$listaMaisVendidoAtom.reportWrite(value, super.listaMaisVendido, () {
      super.listaMaisVendido = value;
    });
  }

  final _$currentAtom = Atom(name: '_HomeStore.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$productForIdAtom = Atom(name: '_HomeStore.productForId');

  @override
  ProductModel get productForId {
    _$productForIdAtom.reportRead();
    return super.productForId;
  }

  @override
  set productForId(ProductModel value) {
    _$productForIdAtom.reportWrite(value, super.productForId, () {
      super.productForId = value;
    });
  }

  @override
  String toString() {
    return '''
listaBanner: ${listaBanner},
listaCategoria: ${listaCategoria},
listaMaisVendido: ${listaMaisVendido},
current: ${current},
productForId: ${productForId}
    ''';
  }
}
