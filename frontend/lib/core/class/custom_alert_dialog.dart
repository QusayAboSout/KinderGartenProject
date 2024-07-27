import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:get/get_connect/http/src/request/request.dart';

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
      backgroundColor: AppColors.LIGHT_TEXT,
      titleTextStyle: TextStyle(
          color: headColor ?? AppColors.CREMIZON,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      contentTextStyle: const TextStyle(color: AppColors.LIGHT_TEXT),
      title: headText != null ? Text(headText!) : null,
      content: Text(bodyText),
      actions: <Widget>[
        CustomButton(
            txtColor: AppColors.LIGHT_TEXT,
            text: ButtonText,
            color: AppColors.SECONDARY_COLOR,
            onPressed: onPressed)
      ],
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
      backgroundColor: AppColors.LIGHT_TEXT,
      titleTextStyle: TextStyle(
        color: headColor ?? AppColors.SECONDARY_COLOR,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      contentTextStyle: const TextStyle(color: AppColors.LIGHT_TEXT),
      title: headText != null ? Text(headText!) : null,
      content: widget,
      actions: <Widget>[
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor ?? AppColors.SECONDARY_COLOR,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: AppColors.LIGHT_TEXT),
          ),
        ),
      ],
    );
  }
}
