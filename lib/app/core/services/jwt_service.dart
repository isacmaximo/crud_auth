import 'package:crud_auth/app/core/services/shared_local_storage_service.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';

class JwtService {
  final Logger _logger;
  final SharedLocalStorageService _storageService;

  late Dio _client;

  JwtService(this._logger, this._storageService) {
    _client = Dio();
    _client.options.headers['Content-Type'] = 'application/json';
    _client.options.headers.remove('Authorization');
    _client.options.sendTimeout = sendTimeout;
    _client.options.connectTimeout = connectTimeout;
    _client.options.receiveTimeout = receiveTimeout;
  }

  Future<void> setJWT(String jwt) async {
    await _storageService.put('jwt', jwt);
  }

  Future<String> getJWT() async {
    return await _storageService.get('jwt') ?? '';
  }

  Future<Map<String, dynamic>?> getPayload() async {
    var jwt = await getJWT();

    if (jwt.isNotEmpty) {
      try {
        return JwtDecoder.decode(jwt);
      } on FormatException catch (e) {
        _logger.e('Falha ao realizar o decode do token JWT.', error: e);
      }
    }
    return null;
  }

  //Retorna id do usuário logado.
  Future<String?> getLoggedUserId() async {
    var payload = await getPayload();
    return payload?['user_id'];
  }

  Future<void> logout() async {
    await _storageService.delete('jwt');
    Modular.to.pushReplacementNamed('/login');
  }

  Future<bool> _refreshJwtToken() async {
    Response? response;
    try {
      final jwt = await getJWT();
      if (jwt.isEmpty) {
        await logout();
        return false;
      }

      response = await _client.post(
        '${api}auth/refresh-token',
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwt',
          },
        ),
      );
    } on DioException catch (e) {
      _logger.e('Erro ao tentar atualizar o token JWT.', error: e);
    }

    if (response != null && response.statusCode == 200) {
      var jwt = response.data['token'];
      await setJWT(jwt);
      _logger.i('Token JWT atualizado com sucesso!');
      return true;
    }

    await logout();
    return false;
  }

  Future<bool> isLogged() async {
    var jwt = await getJWT();
    if (jwt.isEmpty) return false;
    return JwtDecoder.isExpired(jwt) ? await _refreshJwtToken() : true;
  }
}
