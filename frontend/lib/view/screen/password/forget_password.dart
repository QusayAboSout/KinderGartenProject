import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/core/class/row_text_button.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final SiginUpController controller = Get.find<SiginUpController>();
  bool showButton = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logoPro.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: SafeArea(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: AppColors.SECONDARY_COLOR,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'لا تقلق! سيتم تغيير كلمة المرور عن طريق ادخال \n البريد الإلكتروني المرتبط بالحساب.',
                        style: TextStyle(
                            color: AppColors.LIGHT_TEXT, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    formName: 'email',
                    label: 'قم بإدخال البريد الإلكتروني',
                    hint: 'البريد الإلكتروني',
                    textInputType: TextInputType.emailAddress,
                    validate: (value) {
                      if ((value == null || value.isEmpty)) {
                        return "يرجى ادخال البريد الالكتروني";
                      } else if (!value.contains('@gmail.com') &&
                          !value.contains('@outlook.com')) {
                        return "يرجى إدخال الحساب بشكل صحيح";
                      } else if (value.contains('@gmail.com')) {
                        if (value[value.length - 1] != 'm' &&
                            value[value.length - 2] != 'o') {
                          return "يرجى إدخال الحساب بشكل صحيح";
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  GetBuilder<SiginUpController>(
                    id: 'progress',
                    builder: (controller) {
                      return Column(
                        children: [
                          if (controller.showProgress)
                            const CustomLoadingAnimation(),
                        ],
                      );
                    },
                  ),
                  Visibility(
                      visible: showButton,
                      child: CustomButton(
                        text: 'تحقق',
                        onPressed: () {
                          if (IsValid()) {
                            // controller.user.email =
                            //     _formKey.currentState?.value["email"];
                            // controller.sendEmailCode();

                            // Get.to(() => ChangePassword());
                          }
                        },
                      )),
                  const RowTextButton(
                    text: 'هل تذكرت كلمة المرور؟',
                    ButtonText: 'رجوع',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  bool IsValid() => _formKey.currentState!.saveAndValidate();
}
