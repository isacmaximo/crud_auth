import 'package:crud_auth/app/components/button/custom_button.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String info;
  final String? buttonTitleLeft;
  final String? buttonTitleRight;
  final void Function()? onPressedLeft;
  final void Function()? onPressedRight;
  const InfoDialog({
    super.key,
    required this.info,
    this.buttonTitleLeft,
    this.buttonTitleRight,
    this.onPressedLeft,
    this.onPressedRight,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.35,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                info,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    width: size.width * 0.25,
                    title: buttonTitleLeft ?? 'Sim',
                    onPressed: onPressedLeft,
                  ),
                  CustomButton(
                    width: size.width * 0.25,
                    title: buttonTitleRight ?? 'Não',
                    onPressed: onPressedRight,
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
