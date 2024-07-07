import 'package:crud_auth/app/core/globlal_loading/loading_singleton.dart';
import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/core/http/refresh_token_interceptor.dart';
import 'package:crud_auth/app/core/services/auth_service.dart';
import 'package:crud_auth/app/core/services/firebase_auth_service.dart';
import 'package:crud_auth/app/core/services/firebase_notification_service.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class AppModule extends Module {
  final Logger _logger;
  final SharedLocalStorageService _localStorage;

  AppModule(this._logger, this._localStorage);

  @override
  void binds(i) {
    i.addInstance(_logger);
    i.addInstance(_localStorage);
    i.addInstance(LoadingSingleton().getController());
    i.addSingleton(() => FirebaseAuthService());
    i.addSingleton(JwtService.new);
    i.addSingleton(RefreshTokenInterceptor.new);
    i.addSingleton(HttpClient.new);
    i.addSingleton(AuthService.new);
    i.addLazySingleton(() => FirebaseNotificationService(i(), i(), i(), i()));
    super.binds(i);
  }

  @override
  void routes(r) {
    r.module(
      Modular.initialRoute,
      module: AuthModule(_logger, _localStorage),
    );
    super.routes(r);
  }
}
