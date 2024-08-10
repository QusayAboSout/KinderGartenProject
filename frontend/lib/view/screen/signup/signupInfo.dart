import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/loginController.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:get/get.dart';

class signupInfo extends StatelessWidget {
  String? code;
  signupInfo({this.code, super.key});

  final GlobalKey<FormBuilderState> _formUserInfo =
      GlobalKey<FormBuilderState>();
  final SiginUpController controller = Get.find<SiginUpController>();
  final LoginController loginController = Get.find<LoginController>();
  @override
  // signupinfofast
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialog(
                      headText: 'تحذير !!',
                      bodyText:
                          'سيتم الغاء عملية تسجيل الحساب \n هل انت متاكد من الرجوع ؟',
                      ButtonText: 'رجوع',
                      onPressed: () {
                        Get.offAll(() => Login());
                      },
                    );
                  });
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
        child: GetBuilder<SiginUpController>(
            init: controller,
            builder: (controller) {
              return Center(
                child: FormBuilder(
                  key: _formUserInfo,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        'معلومات الحساب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: AppColors.CREMIZON,
                        ),
                      ),
                      const SizedBox(height: 70),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: 'اسم المستخدم',
                        hint: 'ادخل اسم المستخدم',
                        textInputType: TextInputType.text,
                        formName: 'name',
                        validate: (value) {
                          if ((value == null || value.isEmpty)) {
                            return "يرجى عدم ترك هذا الحقل فارغ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: 'رقم الهاتف',
                        hint: 'ادخل رقم الهاتف',
                        textInputType: TextInputType.number,
                        formName: 'mobileNo',
                        inputFormat: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        validate: (value) {
                          if ((value == null || value.isEmpty)) {
                            return "يرجى عدم ترك هذا الحقل فارغ";
                          }
                          return null;
                        },
                        maxLength: 10,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: 'كلمة المرور',
                        hint: 'إدخل كلمة المرور',
                        textInputType: TextInputType.visiblePassword,
                        formName: 'password',
                        validate: (value) {
                          if ((value == null || value.isEmpty)) {
                            return "يرجى عدم ترك هذا الحقل فارغ";
                          } else if (value.length < 7) {
                            return "كلمة المرور قصيرة !";
                          }
                          return null;
                        },
                        password: true,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: 'تأكيد كلمة المرور',
                        hint: 'تأكيد كلمة المرور',
                        textInputType: TextInputType.visiblePassword,
                        formName: 'confirmPassword',
                        validate: (value) {
                          if ((value == null || value.isEmpty)) {
                            return "يرجى عدم ترك هذا الحقل فارغ";
                          } else if (value.length < 7) {
                            return "كلمة المرور قصيرة !";
                          } else if (value !=
                              _formUserInfo
                                  .currentState!.fields['password']?.value) {
                            return "كلمة المرور غير متطابقة";
                          }
                          return null;
                        },
                        password: true,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: "تأكيد إنشاء الحساب",
                        onPressed: () async {
                          if (isValid()) {
                            controller.code = code;
                            await addUserInfo();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                    headText: 'تم إنشاء الحساب بنجاح !!',
                                    bodyText:
                                        'تم إنشاء الحساب بنجاح, سيتم نقلك إلى صفحة تسجيل الدخول للتسجيل باستخدام الحساب الذي أنشأته',
                                    ButtonText: 'موافق',
                                    onPressed: () {
                                      Get.offAll(() => Login());
                                    },
                                  );
                                });
                          } else {
                            print(" Signup rejected !! \n");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  bool isValid() => _formUserInfo.currentState!.saveAndValidate();

  Future<void> addUserInfo() async {
    if (!isValid()) return;
    //////////
    controller.user.name = _formUserInfo.currentState?.value["name"];
    controller.user.password = _formUserInfo.currentState?.value["password"];
    controller.user.mobileNo = _formUserInfo.currentState?.value["mobileNo"];
    controller.user.role = "student";
    //////////

    var result = await controller.siginUp();
    loginController.update();
  }
}
