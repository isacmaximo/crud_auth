import 'package:flutter_modular/flutter_modular.dart';

class AuthRouteController {
  void goToRegister() {
    Modular.to.pushNamed('/register');
  }

  void goToHome() {
    Modular.to.pushNamed('/');
  }
}
