import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';
import 'package:crud_auth/app/core/services/auth_service.dart';
import 'package:crud_auth/app/core/services/firebase_auth_service.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/models/auth_credentials.dart';
import 'package:crud_auth/app/modules/auth/pages/controllers/auth_route_controller.dart';
import 'package:crud_auth/app/shared/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final JwtService _jwtService;
  final AuthService _authService;
  final AuthRouteController _routeController;
  final LoadingController _loadingController;
  final FirebaseAuthService _firebaseAuthService;

  AuthControllerBase(
    this._jwtService,
    this._authService,
    this._routeController,
    this._loadingController,
    this._firebaseAuthService,
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
  Future<void> _handleLogin(String? token) async {
    if (token != null) {
      await _authService.login(token);

      clearAllInputs();

      var userId = await _jwtService.getLoggedUserId();

      if (userId != null) {
        _routeController.goToHome();
      }
    }
  }

  @action
  Future<void> loginWithEmail() async {
    _loadingController.startLoading();
    try {
      var token = await _firebaseAuthService.signInWithEmail(
        AuthCredentialsDTO(
          login: userController.text,
          password: passwordController.text,
        ),
      );
      await _handleLogin(token);
    } on FlutterError catch (e) {
      _firebaseAuthService.signOut();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> loginWithGoogle() async {
    _loadingController.startLoading();
    try {
      var token = await _firebaseAuthService.signInWithGoogle();
      await _handleLogin(token);
    } on FlutterError catch (e) {
      _firebaseAuthService.signOut();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> registerWithGoogle() async {
    _loadingController.startLoading();

    try {
      var token = await _firebaseAuthService.signInWithGoogle();
      await _authService.registerWithFirebaseToken(token ?? '');

      clearAllInputs();
      Modular.to.pop();
      EasyLoading.showSuccess('Cadastro realizado com sucesso!');
    } on FlutterError catch (e) {
      _firebaseAuthService.signOut();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> registerWithCredentials() async {
    _loadingController.startLoading();

    var dto = AuthCredentialsDTO(
      login: userController.text,
      password: passwordController.text,
    );

    try {
      await _authService.registerWithCredentials(dto.login, dto.password);

      clearAllInputs();
      Modular.to.pop();
      EasyLoading.showSuccess('Cadastro realizado com sucesso!');
    } on FlutterError catch (e) {
      _firebaseAuthService.signOut();
      EasyLoading.showError(e.message);
    }

    _loadingController.stopLoading();
  }
}
