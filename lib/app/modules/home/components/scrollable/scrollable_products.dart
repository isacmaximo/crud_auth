import 'package:crud_auth/app/models/store/product_store_dto.dart';
import 'package:crud_auth/app/modules/home/components/cards/product_card.dart';
import 'package:flutter/material.dart';

class ScrollableProducts extends StatelessWidget {
  final List<ProductStore> products;
  final void Function(int index, BuildContext context)? onPressedEdit;
  final void Function(ProductStore product)? onPressedDelete;
  const ScrollableProducts({
    super.key,
    required this.products,
    this.onPressedEdit,
    this.onPressedDelete,
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
            onPressedEdit: () => onPressedEdit!(index, context),
            onPressedDelete: () => onPressedDelete,
          );
        },
      ),
    );
  }
}
