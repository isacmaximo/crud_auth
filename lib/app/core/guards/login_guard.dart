import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginGuard extends RouteGuard {
  LoginGuard() : super(redirectTo: '/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    var jwtService = Modular.get<JwtService>();
    return await jwtService.isLogged();
  }
}
