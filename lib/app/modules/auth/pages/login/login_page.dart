import 'package:crud_auth/app/components/button/custom_button.dart';
import 'package:crud_auth/app/components/input/custom_input.dart';
import 'package:crud_auth/app/components/row/row_go_to_register.dart';
import 'package:crud_auth/app/components/screen/base_screen.dart';
import 'package:crud_auth/app/modules/auth/pages/controllers/auth_controller.dart';
import 'package:crud_auth/app/shared/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  final _controller = Modular.get<AuthController>();
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Login',
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              CustomInput(
                hintText: 'Usuário',
                controller: _controller.userController,
                prefixIcon: const Icon(Icons.person),
                validator: Validator.emailFieldValidation,
              ),
              CustomInput(
                hintText: 'Senha',
                obscureText: true,
                controller: _controller.passwordController,
                prefixIcon: const Icon(Icons.lock),
                validator: Validator.requiredPassword,
              ),
              RowGoToRegister(
                onPressed: _controller.goToRegister,
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                title: 'Entrar',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _controller.login();
                  }
                },
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
