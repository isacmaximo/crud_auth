import 'package:crud_auth/app/core/globlal_loading/loading_singleton.dart';
import 'package:crud_auth/app/core/globlal_loading/loading_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppWidget extends StatelessWidget {
  final loadingController = LoadingSingleton().getController();
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crud Auth',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      builder: EasyLoading.init(
        builder: (context, child) => Observer(
          builder: (context) => LoadingWrapper(
            isLoading: loadingController.isLoading,
            child: child,
          ),
        ),
      ),
    );
  }
}
