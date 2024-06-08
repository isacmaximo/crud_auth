import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/models/dto/user_dto.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthService {
  final HttpClient _client;
  final JwtService _jwtService;

  AuthService(
    this._client,
    this._jwtService,
  );

  Future<void> login(UserDTO userDTO) async {
    String url = '${api}auth/login';
    Response? response;

    try {
      response = await _client.post(url, data: userDTO.toMap());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        EasyLoading.showError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      var token = response.data['token'];
      await _jwtService.setJWT(token);
      return;
    }
  }

  Future<void> register(UserDTO userDTO) async {
    String url = '${api}auth/register';
    Response? response;

    try {
      response = await _client.post(url, data: userDTO.toMap());
    } on DioException catch (e) {
      if (e.response != null && [400, 500].contains(e.response!.statusCode)) {
        EasyLoading.showError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      var token = response.data['token'];
      await _jwtService.setJWT(token);
      return;
    }
  }
}
