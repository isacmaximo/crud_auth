import 'dart:async';

import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class FCMConfig extends Disposable {
  late FirebaseMessaging _messaging;
  late NotificationDetails _notificationDetails;
  late AndroidNotificationDetails _androidDetails;
  late DarwinNotificationDetails _iosDetails;
  late FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  late StreamSubscription<RemoteMessage> _foregroundMessageHandler;

  final Logger _logger;
  final SharedLocalStorageService _localStorage;

  FCMConfig(this._logger, this._localStorage) {
    _messaging = FirebaseMessaging.instance;
  }

  Future<void> init() async {
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final isPermitted = await _requestPermission();

    if (!isPermitted) return;

    _androidDetails = const AndroidNotificationDetails(
      'push_deep_app',
      'push_deep_app',
      importance: Importance.max,
      priority: Priority.max,
    );

    _iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    _notificationDetails = NotificationDetails(
      android: _androidDetails,
      iOS: _iosDetails,
    );

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    _localNotificationsPlugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: _onSelectNotification,
    );

    await _messaging.subscribeToTopic("all");
    _foregroundMessageHandler = _onReciveForegroundPush();
  }

  Future<bool> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
      case AuthorizationStatus.provisional:
        await _localStorage.put('pushToken', await _messaging.getToken());
        return true;
      default:
        const msg = 'Para receber atualizações, ative as notificações!';
        EasyLoading.showInfo(msg);
        return false;
    }
  }

  // Escutando as push notifications.
  StreamSubscription<RemoteMessage> _onReciveForegroundPush() {
    return FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        _localNotificationsPlugin.show(
          message.hashCode,
          message.notification?.title ?? 'Sem título',
          message.notification?.body ?? 'Sem mensagem',
          _notificationDetails,
          payload: message.data.toString(),
        );
      },
    );
  }

  _onSelectNotification(NotificationResponse notification) {
    if (notification.payload != null && notification.payload!.isNotEmpty) {
      _logger.i('Notification Payload: ${notification.payload}');
    }
  }

  @override
  void dispose() {
    _foregroundMessageHandler.cancel();
  }
}
