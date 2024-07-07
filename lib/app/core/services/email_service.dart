import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EmailService {
  final HttpClient _client;
  EmailService(this._client);

  Future<String?> sendEmailDeepLink() async {
    String url = '${api}email/deep-link';
    Response? response;

    try {
      response = await _client.get(url);
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      return response.data;
    }
    throw FlutterError('Falha ao enviar e-mail!');
  }
}
