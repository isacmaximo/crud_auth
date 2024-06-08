import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/modules/home/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../components/button/custom_button.dart';

class ProfilePage extends StatelessWidget {
  final _controller = Modular.get<ProfileController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Perfil',
      child: Center(
        child: Column(
          children: [
            CustomButton(
              title: 'Sair',
              onPressed: () async {
                await _controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
