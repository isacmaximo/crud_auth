// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  late final _$_handleLoginAsyncAction =
      AsyncAction('AuthControllerBase._handleLogin', context: context);

  @override
  Future<void> _handleLogin(String? token) {
    return _$_handleLoginAsyncAction.run(() => super._handleLogin(token));
  }

  late final _$loginWithEmailAsyncAction =
      AsyncAction('AuthControllerBase.loginWithEmail', context: context);

  @override
  Future<void> loginWithEmail() {
    return _$loginWithEmailAsyncAction.run(() => super.loginWithEmail());
  }

  late final _$loginWithGoogleAsyncAction =
      AsyncAction('AuthControllerBase.loginWithGoogle', context: context);

  @override
  Future<void> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  late final _$registerWithGoogleAsyncAction =
      AsyncAction('AuthControllerBase.registerWithGoogle', context: context);

  @override
  Future<void> registerWithGoogle() {
    return _$registerWithGoogleAsyncAction
        .run(() => super.registerWithGoogle());
  }

  late final _$registerWithCredentialsAsyncAction = AsyncAction(
      'AuthControllerBase.registerWithCredentials',
      context: context);

  @override
  Future<void> registerWithCredentials() {
    return _$registerWithCredentialsAsyncAction
        .run(() => super.registerWithCredentials());
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void clearAllInputs() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.clearAllInputs');
    try {
      return super.clearAllInputs();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hideKeyboard() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.hideKeyboard');
    try {
      return super.hideKeyboard();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToRegister() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.goToRegister');
    try {
      return super.goToRegister();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBackToLogin() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.goBackToLogin');
    try {
      return super.goBackToLogin();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
