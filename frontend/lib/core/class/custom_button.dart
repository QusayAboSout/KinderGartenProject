import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  double? buttonWidth;
  double? buttonHeight;
  Color? color;
  Color? txtColor;
  final VoidCallback onPressed;
  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
    this.color,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? MediaQuery.of(context).size.width * 9 / 10,
      height: buttonHeight ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
