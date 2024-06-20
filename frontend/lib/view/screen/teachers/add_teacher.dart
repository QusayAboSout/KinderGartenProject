import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:frontend/view/screen/signup/sign_up.dart';
import 'package:frontend/view/screen/teachers/taecher.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  final TextEditingController dataController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final TeacherController teacherController = Get.find<TeacherController>();
  final SiginUpController siginUpController = Get.find<SiginUpController>();
  double? sizedBoxHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
      init: teacherController,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          title: const Text(
            'إضافة معلمة',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.LIGHT_TEXT),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.BACKGROUND_COLOR,
              ),
            ),
          ],
          backgroundColor: AppColors.SECONDARY_COLOR,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "روضة نور الإيمان الخاصة",
                      style: GoogleFonts.marhey(
                          textStyle: const TextStyle(
                        color: AppColors.LIGHT_TEXT,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'اسم المستخدم',
                      hint: 'ادخل اسم المستخدم',
                      formName: 'email',
                      textInputType: TextInputType.text,
                      validate: (value) {
                        if ((value == null || value.isEmpty)) {
                          return "يرجى ادخال البريد الالكتروني";
                        } else if (!value.contains('@gmail.com') &&
                            !value.contains('@outlook.com')) {
                          return "يرجى إدخال الحساب بشكل صحيح";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                        text: "إرسال رمز التحقق",
                        onPressed: () {
                          if (IsValid()) {
                            sendCode(_formKey);
                          }
                        }),
                    SizedBox(height: sizedBoxHeight),
                    const Divider(
                      thickness: 5,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    const CustomTextField(
                      label: 'اسم المعلمة',
                      hint: 'الاسم...',
                      formName: 'teacherName',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'رقم الهاتف',
                      hint: 'الرقم...',
                      formName: 'phoneNumber',
                      textInputType: TextInputType.number,
                      isQ: true,
                      inputFormat: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'رقم الهوية',
                      hint: 'الرقم...',
                      formName: 'idNumber',
                      textInputType: TextInputType.number,
                      isQ: true,
                      inputFormat: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    const CustomTextField(
                      label: 'اسم التخصص',
                      hint: 'التخصص...',
                      formName: 'speciallizationName',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    SizedBox(height: sizedBoxHeight),
                    CustomButton(
                        text: "إضافة",
                        onPressed: () {
                          if (IsValid()) {
                            controller.addTeacher(_formKey.currentState!.value);
                            print(" Every thing looks great");
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                headText: "إضافة معلمة",
                                bodyText:
                                    "تمت إضافة المعلمة ${_formKey.currentState!.value["teacherName"]}",
                                ButtonText: "موافق",
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                              ),
                            );
                          }
                        }),
                    SizedBox(height: sizedBoxHeight),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool IsValid() => _formKey.currentState!.saveAndValidate();

  void addUserInfo() async {
    if (!IsValid()) return;
    GetBuilder<SiginUpController>(
      init: siginUpController,
      builder: (controller) {
        // controller.user.name = _formKey.currentState?.value["teacherName"];
        // controller.user.password = _formKey.currentState?.value["password"];
        // controller.user.mobileNo = _formKey.currentState?.value["phoneNumber"];
        // controller.user.email = _formKey.currentState?.value['email'];
        // controller.user.role = "teacher";
        // //////////
        // var result = controller.siginUp();

        return const Row();
      },
    );
  }

  void sendCode(GlobalKey<FormBuilderState> codeKey) {
    if (!IsValid()) return;
    teacherController.CheckEmailVerificationCode(codeKey);
  }
}
