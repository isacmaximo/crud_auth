import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/core/services/product_service.dart';
import 'package:crud_auth/app/models/dto/product_dto.dart';
import 'package:crud_auth/app/models/store/product_store_dto.dart';
import 'package:crud_auth/app/modules/home/components/dialog/edit_dialog.dart';
import 'package:crud_auth/app/shared/util/currency_util.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @action
  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  clearAllFields() {
    nameController.clear();
    priceController.clear();
  }

  @observable
  ObservableList<ProductStore> listPrduct = ObservableList<ProductStore>.of([]);

  @action
  loadAllProducts() async {
    _loadingController.startLoading();
    try {
      var listDTO = await _productService.getAllProducts();
      listPrduct = ObservableList<ProductStore>.of(
        listDTO
            .map(
              (dto) => ProductStore(
                id: dto.id,
                name: dto.name,
                price: dto.price,
              ),
            )
            .toList(),
      );
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  registerProduct() async {
    _loadingController.startLoading();
    hideKeyboard();

    try {
      await _productService.saveProduct(ProductDTO(
        name: nameController.text,
        price: CurrencyUtil.parseCurrency(
          priceController.text,
        ),
      ));
      await loadAllProducts();
      clearAllFields();
      EasyLoading.showSuccess('Produto salvo com sucesso!');
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  onTapEdit(
    int index,
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditDialog(
          productStore: listPrduct[index],
          nameController: nameController,
          priceController: priceController,
          onPressedEdit: updateProduct,
        );
      },
    ).then((value) => clearAllFields());
  }

  @action
  Future<void> updateProduct(ProductDTO product) async {
    _loadingController.startLoading();

    hideKeyboard();

    try {
      await _productService
          .updateProduct(product)
          .then((_) => loadAllProducts());
      Modular.to.pop();
      EasyLoading.showSuccess('Produto editado com sucesso!');
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }
}
