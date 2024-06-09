// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  late final _$listPrductAtom =
      Atom(name: 'ProductControllerBase.listPrduct', context: context);

  @override
  ObservableList<ProductStore> get listPrduct {
    _$listPrductAtom.reportRead();
    return super.listPrduct;
  }

  @override
  set listPrduct(ObservableList<ProductStore> value) {
    _$listPrductAtom.reportWrite(value, super.listPrduct, () {
      super.listPrduct = value;
    });
  }

  late final _$loadAllProductsAsyncAction =
      AsyncAction('ProductControllerBase.loadAllProducts', context: context);

  @override
  Future loadAllProducts() {
    return _$loadAllProductsAsyncAction.run(() => super.loadAllProducts());
  }

  late final _$registerProductAsyncAction =
      AsyncAction('ProductControllerBase.registerProduct', context: context);

  @override
  Future registerProduct() {
    return _$registerProductAsyncAction.run(() => super.registerProduct());
  }

  late final _$onTapEditAsyncAction =
      AsyncAction('ProductControllerBase.onTapEdit', context: context);

  @override
  Future onTapEdit(int index, BuildContext context) {
    return _$onTapEditAsyncAction.run(() => super.onTapEdit(index, context));
  }

  late final _$updateProductAsyncAction =
      AsyncAction('ProductControllerBase.updateProduct', context: context);

  @override
  Future<void> updateProduct(ProductDTO product) {
    return _$updateProductAsyncAction.run(() => super.updateProduct(product));
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  dynamic hideKeyboard() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.hideKeyboard');
    try {
      return super.hideKeyboard();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPrduct: ${listPrduct}
    ''';
  }
}
