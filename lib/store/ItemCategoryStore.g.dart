// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemCategoryStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemCategoryStore on _ItemCategoryStore, Store {
  final _$listaProdutosCatAtom =
      Atom(name: '_ItemCategoryStore.listaProdutosCat');

  @override
  ObservableList<ProductModel> get listaProdutosCat {
    _$listaProdutosCatAtom.reportRead();
    return super.listaProdutosCat;
  }

  @override
  set listaProdutosCat(ObservableList<ProductModel> value) {
    _$listaProdutosCatAtom.reportWrite(value, super.listaProdutosCat, () {
      super.listaProdutosCat = value;
    });
  }

  @override
  String toString() {
    return '''
listaProdutosCat: ${listaProdutosCat}
    ''';
  }
}
