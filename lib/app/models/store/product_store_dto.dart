import 'package:mobx/mobx.dart';
part 'product_store_dto.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  @observable
  int? id;
  @observable
  String? name;
  @observable
  double? price;

  ProductStoreBase({
    this.id,
    this.name,
    this.price,
  });
}
