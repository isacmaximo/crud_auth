import 'package:crud_auth/app/components/icon/header_icon.dart';
import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/modules/home/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
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
            const Spacer(
              flex: 1,
            ),
            const HeaderIcon(
              icon: Icons.person,
            ),
            const Spacer(
              flex: 2,
            ),
            CustomButton(
              title: 'Enviar email (Deep Link)',
              onPressed: () async {
                await _controller.sendEmailDeepLink();
              },
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              title: 'Enviar Self Message (FCM)',
              onPressed: () async {
                await _controller.sendSelfNotification();
              },
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              title: 'Sair',
              onPressed: () async {
                await _controller.logout();
              },
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
