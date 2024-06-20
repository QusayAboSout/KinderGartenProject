import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/signup_confirm_code_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/core/class/row_text_button.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:frontend/view/screen/signup/signupInfo.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ConfirmCode extends StatefulWidget {
  String emailValue;
  ConfirmCode({required this.emailValue, super.key});
  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final SiginupConfirmCodeController controller =
      Get.find<SiginupConfirmCodeController>();

  bool showCodeTextField = false; //
  bool sendCodeButton = true;
  bool nextStep = false;
  bool enableTextField = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SiginupConfirmCodeController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() =>  Login());
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.BACKGROUND_COLOR,
              ),
            ),
          ],
          backgroundColor: AppColors.SECONDARY_COLOR,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'تحقق من الكود',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppColors.SECONDARY_COLOR,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(height: 30),
                  CustomTextField(
                    initalValue: widget.emailValue,
                    enabled: false,
                    label: 'البريد الإلكتروني',
                    hint: 'أدخل البريد الألكتروني',
                    textInputType: TextInputType.emailAddress,
                    formName: 'email',
                  ),
                  const SizedBox(height: 29),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "ادخل الكود الذي تم إرساله الى البريد الإلكتروني",
                        style: TextStyle(
                          color: AppColors.SECONDARY_COLOR,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: 'الكود',
                        hint: 'ادخل الكود',
                        textInputType: TextInputType.text,
                        formName: 'code',
                        validate: (value) {
                          if ((value == null || value.isEmpty)) {
                            return "يرجى ادخال الكود";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<SiginupConfirmCodeController>(
                        id: 'wrongCode',
                        builder: (controller) {
                          return Container(
                            child: !controller.checkCode
                                ? const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 20),
                                    child: Text('يوجد خطأ في الكود الذي ادخلته',
                                        style: TextStyle(color: Colors.red)),
                                  )
                                : null,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<SiginupConfirmCodeController>(
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
                      GetBuilder<SiginupConfirmCodeController>(
                          id: 'checkCode',
                          builder: (controller) {
                            return CustomButton(
                              text: "التحقق",
                              onPressed: () async {
                                if (IsValid()) {
                                  await controller.CheckEmailCode(context);
                                  if (controller.checkCode) {
                                    showCodeTextField = false;
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return CustomAlertDialog(
                                            headText:
                                                'تم التحقق من الكود بنجاح :)',
                                            bodyText:
                                                'تم التحقق من ملكية الحساب, سيتم نقلك إلى صفحة تغير كلمة المرور',
                                            ButtonText: 'موافق',
                                            onPressed: () {
                                              Get.to(() => (code: controller.formKey.currentState!.fields['code']!.value));
                                            },
                                          );
                                        }));
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
