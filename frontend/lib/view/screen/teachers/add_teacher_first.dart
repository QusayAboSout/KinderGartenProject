import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/view/screen/teachers/add_teacher_second.dart';
import 'package:frontend/view/screen/teachers/taecher.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class AddTeacherStep1 extends StatefulWidget {
  const AddTeacherStep1({super.key});
  @override
  State<AddTeacherStep1> createState() => _AddTeacherStep1State();
}

class _AddTeacherStep1State extends State<AddTeacherStep1> {
  final TeacherController controller = Get.find<TeacherController>();

  bool showCodeTextField = false; //
  bool sendCodeButton = true;
  bool nextStep = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.PINK,
          foregroundColor: AppColors.SECONDARY_COLOR,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              Get.offAll(() => TeacherManagement());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.SECONDARY_COLOR,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'إنشاء حساب معلمة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppColors.SECONDARY_COLOR,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(height: 30),
                  GetBuilder<TeacherController>(
                      id: 'enableButton',
                      builder: (controller) {
                        return CustomTextField(
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
                            }
                            return null;
                          },
                          enabled: controller.enableButton,
                        );
                      }),
                  GetBuilder<TeacherController>(
                      id: 'doubleEmail',
                      builder: (context) {
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
                  const SizedBox(height: 29),
                  Visibility(
                    visible: showCodeTextField,
                    child: Column(
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
                        GetBuilder<TeacherController>(
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
                                        child: Text(
                                            'يوجد خطأ في الكود الذي ادخلته',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      )
                                    : null,
                              );
                            }),
                        const SizedBox(height: 40),
                        GetBuilder<TeacherController>(
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
                        CustomButton(
                          text: "التحقق",
                          onPressed: () async {
                            if (IsValid()) {
                              controller.CheckEmailCode(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Visibility(
                    visible: sendCodeButton,
                    child: Column(
                      children: [
                        CustomButton(
                          text: "التالي",
                          onPressed: () async {
                            if (IsValid()) {
                              await controller.CheckDoublicateEmail(controller
                                  .formKey.currentState?.value['email']);

                              if (!controller.isDoubleEmail) {
                                controller.sendEmailCode();
                                if (!showCodeTextField) {
                                  setState(() {
                                    sendCodeButton = false;
                                    showCodeTextField = true;
                                  });
                                }
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool IsValid() => controller.formKey.currentState!.saveAndValidate();
}
