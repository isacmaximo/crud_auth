import 'package:crud_auth/app/components/button/custom_button.dart';
import 'package:crud_auth/app/models/dto/product_dto.dart';
import 'package:crud_auth/app/models/store/product_store_dto.dart';
import 'package:crud_auth/app/shared/util/currency_util.dart';
import 'package:crud_auth/app/shared/validators/validator.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../../../components/input/custom_input.dart';

class EditDialog extends StatefulWidget {
  final ProductStore productStore;
  final TextEditingController nameController;
  final MoneyMaskedTextController priceController;
  final Future<void> Function(ProductDTO product)? onPressedEdit;
  final _formKey = GlobalKey<FormState>();
  EditDialog({
    super.key,
    required this.productStore,
    required this.nameController,
    required this.priceController,
    this.onPressedEdit,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  @override
  void initState() {
    widget.nameController.text = widget.productStore.name!;
    widget.priceController.text = CurrencyUtil.doubleToReal(
      widget.productStore.price!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Form(
          key: widget._formKey,
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              CustomInput(
                width: size.width * 0.7,
                controller: widget.nameController,
                hintText: 'Nome do Produto',
                validator: Validator.requiredName,
              ),
              CustomInput(
                width: size.width * 0.7,
                controller: widget.priceController,
                hintText: 'Preço do produto',
                validator: Validator.requiredValidPrice,
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                title: 'Editar',
                width: size.width * 0.7,
                onPressed: () async {
                  if (widget._formKey.currentState!.validate()) {
                    await widget.onPressedEdit!(
                      ProductDTO(
                        id: widget.productStore.id,
                        name: widget.nameController.text,
                        price: CurrencyUtil.parseCurrency(
                          widget.priceController.text,
                        ),
                      ),
                    );
                  }
                },
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
