import 'package:crud_auth/app/modules/home/pages/creation/creation_page.dart';
import 'package:crud_auth/app/modules/home/pages/management/management_page.dart';
import 'package:crud_auth/app/modules/home/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'navigation_controller.g.dart';

class NavigationController = NavigationControllerBase
    with _$NavigationController;

abstract class NavigationControllerBase with Store {
  @observable
  int currentPage = 0;

  List<Widget> pages = [
    ManagementPage(),
    CreationPage(),
    ProfilePage(),
  ];

  @action
  void onSelectPage(int index) {
    currentPage = index;
  }
}
