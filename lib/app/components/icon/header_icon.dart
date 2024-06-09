import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final IconData? icon;
  const HeaderIcon({
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.width * 0.1,
        ),
        child: Icon(
          icon,
          size: size.width * 0.2,
          color: Colors.black,
        ),
      ),
    );
  }
}
