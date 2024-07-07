import 'package:crud_auth/app/app_module.dart';
import 'package:crud_auth/app/app_widget.dart';
import 'package:crud_auth/app/core/fcm_config/fcm_config.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

final _logger = Logger();
final _localStorage = SharedLocalStorageService();
final _fcmConfig = FCMConfig(_logger, _localStorage);

@pragma('vm:entry-point')
Future<void> onReceiveBackgroundMessage(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await _fcmConfig.init();
  FirebaseMessaging.onBackgroundMessage(onReceiveBackgroundMessage);

  runApp(
    ModularApp(
      module: AppModule(_logger, _localStorage),
      child: AppWidget(),
    ),
  );
}
