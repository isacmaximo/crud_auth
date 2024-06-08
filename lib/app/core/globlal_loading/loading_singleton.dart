import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';

class LoadingSingleton {
  LoadingSingleton._privateContructor();

  static final LoadingSingleton _instance =
      LoadingSingleton._privateContructor();

  factory LoadingSingleton() {
    return _instance;
  }

  LoadingController? controller;

  LoadingController getController() {
    if (controller != null) {
      return controller!;
    }
    controller = LoadingController();
    return controller!;
  }
}
