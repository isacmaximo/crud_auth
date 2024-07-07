import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/models/dto/token_jwt_dto.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService {
  final HttpClient _client;
  final JwtService _jwtService;

  AuthService(
    this._client,
    this._jwtService,
  );

  Future<void> login(String token) async {
    String url = '${api}auth/login/firebase-token';
    Response? response;

    try {
      response = await _client.post(url, data: TokenJWT(token).toJson());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      var token = response.data['token'];
      await _jwtService.setJWT(token);
      return;
    }
    throw FlutterError('Falha ao realizar o login!');
  }

  Future<void> registerWithFirebaseToken(String token) async {
    String url = '${api}auth/register/firebase-token';
    Response? response;

    try {
      response = await _client.post(url, data: TokenJWT(token).toJson());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      var token = response.data['token'];
      await _jwtService.setJWT(token);
      return;
    }
    throw FlutterError('Falha ao realizar cadastro!');
  }

  Future<void> registerWithCredentials(String email, String password) async {
    String url = '${api}auth/register-with-credentials';
    Response? response;

    try {
      response = await _client.post(url, queryParameters: {
        'email': email,
        'password': password,
      });
    } on DioException catch (e) {
      if (e.response != null && [400, 500].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      var token = response.data['token'];
      await _jwtService.setJWT(token);
      return;
    }

    throw FlutterError('Falha ao realizar cadastro!');
  }
}
