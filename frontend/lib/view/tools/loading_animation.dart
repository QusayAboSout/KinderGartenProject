import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/core/class/colors.dart';

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: AppColors.LIGHT_TEXT, // Customize the color as needed
        size: 50.0, // Adjust the size as needed
        duration: Duration(seconds: 2),
      ),
    );
  }
}
