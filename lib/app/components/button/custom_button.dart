import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double? width;
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        side: const BorderSide(color: Colors.black, width: 2),
        maximumSize: Size((width ?? size.width * 0.8), 50),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
