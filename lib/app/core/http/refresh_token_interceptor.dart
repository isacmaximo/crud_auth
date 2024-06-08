import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class RefreshTokenInterceptor extends Interceptor {
  final JwtService _jwtService;
  final Logger _logger;

  RefreshTokenInterceptor(this._jwtService, this._logger);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await _jwtService.isLogged()) {
      var jwt = await _jwtService.getJWT();
      options.headers['Authorization'] = 'Bearer $jwt';
    }
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    final path = response.requestOptions.path;
    debugPrint('RESPONSE[$statusCode] => PATH: $path');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    _logger.e('ERROR[$statusCode] => PATH: $path', error: err);
    super.onError(err, handler);
  }
}
