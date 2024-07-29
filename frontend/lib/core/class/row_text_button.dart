import 'package:flutter/material.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/view/screen/password/forget_password.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:frontend/view/screen/signup/sign_up.dart';
import 'package:get/get.dart';

class RowTextButton extends StatelessWidget {
  final text;
  final String ButtonText;
  final double? TextSize;

  const RowTextButton({
    super.key,
    required this.text,
    required this.ButtonText,
    this.TextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Text(
          text,
          style: TextStyle(
            color: AppColors.CREMIZON,
            fontSize: TextSize ?? 20,
          ),
        ),
        TextButton(
          onPressed: () {
            if (ButtonText == 'تسجيل دخول' || ButtonText == 'رجوع') {
              Get.to(() =>  Login());
            } else if (ButtonText == 'إنشاء') {
              Get.to(() => const SignUp());
            } else if (ButtonText == 'تغيير') {
              Get.to(() => const ForgetPassword());
            } else {
              print('Fuck');
            }
          },
          child: Text(
            ButtonText,
            style: const TextStyle(
                color: AppColors.LIGHT_TEXT,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
