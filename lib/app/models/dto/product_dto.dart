// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:crud_auth/app/models/store/product_store_dto.dart';

class ProductDTO {
  String? id;
  String? name;
  double? price;
  ProductDTO({
    this.id,
    this.name,
    this.price,
  });

  ProductDTO copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return ProductDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductDTO.fromProductStore(ProductStore store) {
    return ProductDTO(
      id: store.id,
      name: store.name,
      price: store.price,
    );
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) =>
      ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductDTO(id: $id, name: $name, price: $price)';

  @override
  bool operator ==(covariant ProductDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;
}
