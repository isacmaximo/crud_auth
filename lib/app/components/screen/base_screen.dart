import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final void Function()? onTapBack;
  const BaseScreen({
    super.key,
    required this.title,
    required this.child,
    this.onTapBack,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            leading: onTapBack != null
                ? IconButton(
                    onPressed: onTapBack,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                : Container(),
          ),
          body: child,
        ),
      ),
    );
  }
}
