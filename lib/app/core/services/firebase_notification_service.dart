import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FirebaseNotificationService {
  late FirebaseMessaging _messaging;

  final Logger _logger;
  final HttpClient _client;
  final JwtService _jwtService;
  final SharedLocalStorageService _localStorage;

  FirebaseNotificationService(
    this._client,
    this._jwtService,
    this._localStorage,
    this._logger,
  ) {
    _messaging = FirebaseMessaging.instance;
  }

  Future<void> saveFirebaseToken() async {
    var firebaseToken = await getFirebaseToken();
    var userId = await _jwtService.getLoggedUserId();

    var url = '${api}users/$userId/firebase-token';

    try {
      await _client.post(url, data: {
        'id': userId,
        'firebaseToken': firebaseToken,
      });
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw FlutterError(e.response!.data['message']);
      }
      _logger.e('Falha ao salvar firebase token!', error: e);
    }
  }

  Future<void> deleteFirebaseToken() async {
    var userId = await _jwtService.getLoggedUserId();
    var url = '${api}users/$userId/firebase-token';

    try {
      await _client.delete(url);
      await _localStorage.delete('pushToken');
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw FlutterError(e.response!.data['message']);
      }
      _logger.e('Falha ao deletar firebase token!', error: e);
    }
  }

  Future<String> getFirebaseToken() async {
    var token = await _localStorage.get('pushToken');

    if (token != null) {
      return token;
    }

    token = await _messaging.getToken();
    await _localStorage.put('pushToken', token);
    return token;
  }
}
