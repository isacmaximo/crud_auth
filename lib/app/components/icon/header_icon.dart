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
      child: Container(
        width: size.width * 0.4,
        height: size.width * 0.4,
        margin: EdgeInsets.symmetric(
          vertical: size.width * 0.1,
        ),
        decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: size.width * 0.2,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
