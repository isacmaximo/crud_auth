import 'package:crud_auth/app/components/button/custom_button.dart';
import 'package:crud_auth/app/components/icon/header_icon.dart';
import 'package:crud_auth/app/components/input/custom_input.dart';
import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/components/scrollable/no_glow.dart';
import 'package:crud_auth/app/modules/home/controllers/product_controller.dart';
import 'package:crud_auth/app/shared/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreationPage extends StatelessWidget {
  final _controller = Modular.get<ProductController>();
  CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScreen(
      title: 'Cadastro',
      child: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderIcon(
                icon: Icons.shopping_cart,
              ),
              CustomInput(
                controller: _controller.nameController,
                validator: Validator.requiredName,
                hintText: 'Nome do Produto',
                prefixIcon: const Icon(Icons.local_mall),
              ),
              CustomInput(
                controller: _controller.priceController,
                validator: Validator.requiredValidPrice,
                keyboardType: TextInputType.number,
                hintText: 'Preço do produto',
                prefixIcon: const Icon(Icons.payments),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.05),
                child: CustomButton(
                  title: 'Salvar Produto',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
