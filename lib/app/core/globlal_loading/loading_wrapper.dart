import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget? child;
  final bool isLoading;

  const LoadingWrapper({
    super.key,
    this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        if (isLoading)
          Opacity(
            opacity: 0.7,
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
