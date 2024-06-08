import 'package:crud_auth/app/modules/home/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomNavigationBar extends StatelessWidget {
  final _controller = Modular.get<NavigationController>();
  CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.currentPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _controller.onSelectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
        body: _controller.pages[_controller.currentPage],
      ),
    );
  }
}
