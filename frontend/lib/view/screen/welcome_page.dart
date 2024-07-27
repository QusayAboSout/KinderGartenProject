import 'package:flutter/material.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.BACKGROUND_COLOR,
      body: Container(
        color: AppColors.BACKGROUND_COLOR,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/gpLogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               Text(
                'اهلا وسهلا بكم في روضة \n نور الإيمان الخاصة',
                      style: GoogleFonts.marhey(
                          textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColors.LIGHT_TEXT,
                      )),
              ),
              const SizedBox(height: 150),
              CustomButton(
                  color: AppColors.CREMIZON,
                  txtColor: AppColors.LIGHT_TEXT,
                  text: 'التالي',
                  onPressed: () {
                    Get.to(() =>  Login());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
