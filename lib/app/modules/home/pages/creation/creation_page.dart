import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/modules/home/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreationPage extends StatelessWidget {
  final _controller = Modular.get<ProductController>();
  CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Cadastro',
      child: Center(),
    );
  }
}
