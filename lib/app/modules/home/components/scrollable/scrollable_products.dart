import 'package:crud_auth/app/models/store/product_store_dto.dart';
import 'package:crud_auth/app/modules/home/components/cards/product_card.dart';
import 'package:flutter/material.dart';

class ScrollableProducts extends StatelessWidget {
  final List<ProductStore> products;
  const ScrollableProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        products.length,
        (index) {
          return ProductCard(
            name: products[index].name!,
            price: products[index].price!,
          );
        },
      ),
    );
  }
}
