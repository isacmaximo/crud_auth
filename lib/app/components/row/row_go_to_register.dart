import 'package:flutter/material.dart';

class RowGoToRegister extends StatelessWidget {
  final void Function()? onPressed;
  const RowGoToRegister({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Não possui login?'),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Cadastre-se',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
