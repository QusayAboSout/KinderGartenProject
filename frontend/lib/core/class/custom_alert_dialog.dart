import 'package:flutter/material.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  String? headText;
  String bodyText;
  String ButtonText;
  final VoidCallback onPressed;
  Color? btnColor;
  Color? headColor;

  CustomAlertDialog({
    super.key,
    this.headText,
    required this.bodyText,
    required this.ButtonText,
    required this.onPressed,
    this.btnColor,
    this.headColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      title: headText != null
          ? Text(
              headText!,
              style: const TextStyle(color: AppColors.PRIMARY),
            )
          : null,
      content: Text(bodyText),
      actions: <Widget>[CustomButton(text: ButtonText, onPressed: onPressed)],
    );
  }
}

class CustomAlertDialog2 extends StatelessWidget {
  final String? headText;
  final String bodyText;
  final String buttonText;
  final VoidCallback onPressed;
  final Color? btnColor;
  final Color? headColor;
  final Widget? widget;

  const CustomAlertDialog2({
    super.key,
    this.headText,
    required this.bodyText,
    required this.buttonText,
    required this.onPressed,
    this.btnColor,
    this.headColor,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      title: headText != null ? Text(headText!) : null,
      content: widget,
      actions: <Widget>[
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor ?? AppColors.PRIMARY,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: AppColors.TEXT_PRIMARY),
          ),
        ),
      ],
    );
  }
}
