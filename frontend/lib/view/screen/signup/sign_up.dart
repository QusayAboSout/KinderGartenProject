import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/core/class/row_text_button.dart';
import 'package:frontend/view/screen/signup/confirm_code.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SiginUpController controller = Get.find<SiginUpController>();

  bool showCodeTextField = false; //
  bool sendCodeButton = true;
  bool nextStep = false;
  bool enableTextField = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SiginUpController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250),
                  const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppColors.CREMIZON,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(height: 30),
                  CustomTextField(
                    enabled: enableTextField,
                    label: 'البريد الإلكتروني',
                    hint: 'أدخل البريد الألكتروني',
                    textInputType: TextInputType.emailAddress,
                    formName: 'email',
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
                  GetBuilder<SiginUpController>(
                      id: 'doubleEmail',
                      builder: (controller) {
                        return Container(
                          key: const Key("errorLable"),
                          child: (controller.isDoubleEmail)
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Text('هذا الحساب مستخدم بالفعل',
                                      style: TextStyle(color: Colors.red)),
                                )
                              : null,
                        );
                      }),
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
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      GetBuilder<SiginUpController>(
                          id: 'checkDoublicateEmail',
                          builder: (controller) {
                            return CustomButton(
                              text: "التالي",
                              onPressed: () async {
                                if (IsValid()) {
                                  await controller.CheckDoublicateEmail(
                                      controller.formKey.currentState
                                          ?.value['email']);
        
                                  if (!controller.isDoubleEmail) {
                                    controller.user.email = controller
                                        .formKey.currentState?.value["email"];
                                    controller.sendEmailCode();
                                    if (!showCodeTextField) {
                                      setState(() {
                                        sendCodeButton = false;
                                        showCodeTextField = true;
                                      });
                                      Get.to(() => ConfirmCode(
                                          emailValue: controller.formKey
                                              .currentState!.value['email']));
                                    }
                                  }
                                }
                              },
                            );
                          }),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const RowTextButton(
                    text: 'هل لديك حساب؟',
                    ButtonText: 'تسجيل دخول',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool IsValid() {
    return controller.formKey.currentState!.saveAndValidate();
  }
}
