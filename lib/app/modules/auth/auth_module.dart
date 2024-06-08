import 'package:crud_auth/app/app_module.dart';
import 'package:crud_auth/app/core/guards/login_guard.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/app/modules/auth/pages/controllers/auth_controller.dart';
import 'package:crud_auth/app/modules/auth/pages/controllers/auth_route_controller.dart';
import 'package:crud_auth/app/modules/auth/pages/login/login_page.dart';
import 'package:crud_auth/app/modules/auth/pages/register/register_page.dart';
import 'package:crud_auth/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class AuthModule extends Module {
  final Logger _logger;
  final SharedLocalStorageService _localStorage;

  AuthModule(this._logger, this._localStorage);

  @override
  List<Module> get imports => [AppModule(_logger, _localStorage)];

  @override
  void binds(i) {
    i.addLazySingleton(AuthRouteController.new);
    i.addLazySingleton(AuthController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: HomeModule(_logger, _localStorage),
      guards: [
        LoginGuard(),
      ],
    );
    r.child(
      '/login',
      child: (context) => LoginPage(),
    );
    r.child(
      '/register',
      child: (context) => RegisterPage(),
    );

    super.routes(r);
  }
}
