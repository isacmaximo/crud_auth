// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/models/dto/token_jwt_dto.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final HttpClient _client;

  NotificationService(
    this._client,
  );

  Future<String?> sendNotificationByFirebaseToken(String firebaseToken) async {
    String url = '${api}notification/self';
    Response? response;

    try {
      response = await _client.post(url, data: TokenJWT(firebaseToken).toMap());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      return response.data;
    }
    throw FlutterError('Falha ao enviar mensagem!');
  }
}
