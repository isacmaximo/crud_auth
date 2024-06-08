import 'package:crud_auth/app/shared/util/currency_util.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.onPressedEdit,
    this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        elevation: 2,
        child: SizedBox(
          width: size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      CurrencyUtil.doubleToReal(price),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                  onPressed: onPressedEdit,
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: onPressedDelete,
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
