import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeepLinkPage extends StatelessWidget {
  const DeepLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onTapBack: () {
        Modular.to.pop();
      },
      title: 'Deep Link Page',
      child: Center(
        child: Text(
          'Deep Link Funcionando!',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
