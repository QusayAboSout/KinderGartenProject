import 'package:flutter/material.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.BACKGROUND_COLOR,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/WelcomePage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: 400,
                //   height: 400,
                //   child: CircleAvatar(
                //     radius: 80,
                //     backgroundColor: Colors.transparent,
                //     child: Image.asset(
                //       'assets/images/gpLogo.png',
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // const Text(
                //   'اهلا وسهلا بكم في روضة نور الإيمان الخاصة',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: AppColors.GREEN),
                // ),
                const SizedBox(height: 600),
                CustomButton(
                    color: AppColors.GREEN,
                    txtColor: AppColors.LIGHT,
                    text: 'التالي',
                    onPressed: () {
                      Get.to(() =>  Login());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
