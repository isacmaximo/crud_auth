import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/core/services/product_service.dart';
import 'package:crud_auth/app/models/store/product_store_dto.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final LoadingController _loadingController;
  final ProductService _productService;
  final JwtService _jwtService;

  ProductControllerBase(
    this._loadingController,
    this._productService,
    this._jwtService,
  ) {
    _jwtService.isLogged().then((value) => loadAllProducts());
  }

  final nameController = TextEditingController();

  final priceController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );

  @observable
  ObservableList<ProductStore> listPrduct = ObservableList<ProductStore>.of([]);

  @action
  loadAllProducts() async {
    _loadingController.startLoading();
    try {
      await _productService.getAllProducts().then(
        (listDto) {
          for (var e in listDto) {
            listPrduct.add(
              ProductStore(
                id: e.id,
                name: e.name,
                price: e.price,
              ),
            );
          }
        },
      );
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }
}
