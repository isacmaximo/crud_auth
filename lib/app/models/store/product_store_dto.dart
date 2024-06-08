import 'package:crud_auth/app/models/dto/product_dto.dart';
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

  factory ProductStoreBase.fromProductDTO(ProductDTO dto) {
    return ProductStore(
      id: dto.id,
      name: dto.name,
      price: dto.price,
    );
  }
}
