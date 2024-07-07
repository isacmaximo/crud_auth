import 'package:crud_auth/app/core/globlal_loading/loading_controller.dart';
import 'package:crud_auth/app/core/services/email_service.dart';
import 'package:crud_auth/app/core/services/firebase_notification_service.dart';
import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:crud_auth/app/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final JwtService _jwtService;
  final NotificationService _notificationService;
  final FirebaseNotificationService _firebaseNotificationService;
  final LoadingController _loadingController;
  final EmailService _emailService;
  ProfileControllerBase(
    this._jwtService,
    this._notificationService,
    this._firebaseNotificationService,
    this._loadingController,
    this._emailService,
  ) {
    saveFirebaseToken();
  }

  @action
  Future<void> saveFirebaseToken() async {
    _loadingController.startLoading();

    try {
      await _firebaseNotificationService.saveFirebaseToken();
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> sendSelfNotification() async {
    _loadingController.startLoading();

    try {
      var firebaseToken = await _firebaseNotificationService.getFirebaseToken();
      await _notificationService.sendNotificationByFirebaseToken(firebaseToken);
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> sendEmailDeepLink() async {
    _loadingController.startLoading();

    try {
      await _emailService.sendEmailDeepLink();
    } on FlutterError catch (e) {
      _loadingController.stopLoading();
      EasyLoading.showError(e.message);
    }
    _loadingController.stopLoading();
  }

  @action
  Future<void> logout() async {
    await _jwtService.logout();
  }
}
