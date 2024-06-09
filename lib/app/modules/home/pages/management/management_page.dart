import 'package:crud_auth/app/components/icon/header_icon.dart';
import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/components/scrollable/no_glow.dart';
import 'package:crud_auth/app/modules/home/components/scrollable/scrollable_products.dart';
import 'package:crud_auth/app/modules/home/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManagementPage extends StatelessWidget {
  final _controller = Modular.get<ProductController>();
  ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Gerenciamento',
      child: Column(
        children: [
          const HeaderIcon(
            icon: Icons.data_saver_off,
          ),
          ScrollConfiguration(
            behavior: NoGlow(),
            child: Observer(
              builder: (_) => _controller.listPrduct.isNotEmpty
                  ? ScrollableProducts(
                      products: _controller.listPrduct,
                      onPressedEdit: _controller.onTapEdit,
                      onPressedDelete: _controller.onTapDelete,
                    )
                  : const Center(
                      child: Text(
                        'Não há produdos cadastrados!',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
