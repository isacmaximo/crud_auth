import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';
import 'package:crud_auth/app/core/services/auth_service.dart';
import 'package:crud_auth/app/models/dto/user_dto.dart';
import 'package:crud_auth/app/modules/auth/pages/controllers/auth_route_controller.dart';
import 'package:crud_auth/app/shared/validators/validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final AuthRouteController _routeController;
  final LoadingController _loadingController;
  final AuthService _authService;

  AuthControllerBase(
    this._routeController,
    this._loadingController,
    this._authService,
  );

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? confirmPasswordValidation(String? pass) {
    return Validator.confirmPassValidation(pass, passwordController.text);
  }

  @action
  void clearAllInputs() {
    userController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @action
  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @action
  void goToRegister() {
    clearAllInputs();
    _routeController.goToRegister();
  }

  @action
  void goBackToLogin() {
    clearAllInputs();
    Modular.to.pop();
  }

  @action
  login() async {
    hideKeyboard();

    UserDTO user = UserDTO(
      login: userController.text,
      password: passwordController.text,
    );

    _loadingController.startLoading();
    await _authService.login(user).then(
      (value) {
        clearAllInputs();
        _routeController.goToHome();
      },
    );

    _loadingController.stopLoading();
  }

  @action
  register() async {
    hideKeyboard();

    _loadingController.startLoading();
    UserDTO user = UserDTO(
      login: userController.text,
      password: passwordController.text,
    );

    try {
      await _authService.register(user);
    } catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError('Erro ao cadastrar');
    }

    _loadingController.stopLoading();
  }
}
