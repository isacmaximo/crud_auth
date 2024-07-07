import 'package:crud_auth/app/app_module.dart';
import 'package:crud_auth/app/core/services/notification_service.dart';
import 'package:crud_auth/app/core/services/product_service.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/app/modules/home/components/navigation/custom_navigation_bar.dart';
import 'package:crud_auth/app/modules/home/controllers/navigation_controller.dart';
import 'package:crud_auth/app/modules/home/controllers/product_controller.dart';
import 'package:crud_auth/app/modules/home/controllers/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class HomeModule extends Module {
  final Logger _logger;
  final SharedLocalStorageService _localStorage;

  HomeModule(this._logger, this._localStorage);

  @override
  List<Module> get imports => [AppModule(_logger, _localStorage)];

  @override
  void binds(i) {
    i.addLazySingleton(() => NavigationController());
    i.addLazySingleton(() => ProductService(i()));
    i.addLazySingleton(() => ProductController(i(), i(), i()));
    i.addLazySingleton(() => NotificationService(i()));
    i.addLazySingleton(() => ProfileController(i(), i(), i(), i()));
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => CustomNavigationBar(),
    );
  }
}
