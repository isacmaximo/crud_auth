import 'package:crud_auth/app/app_module.dart';
import 'package:crud_auth/app/app_widget.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

final _logger = Logger();
final _localStorage = SharedLocalStorageService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(_logger, _localStorage),
      child: AppWidget(),
    ),
  );
}
