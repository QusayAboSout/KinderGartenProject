import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/loginController.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:frontend/view/screen/teachers/taecher.dart';
import 'package:get/get.dart';

class AddTeacherStep2 extends StatelessWidget {
  String? email;
  AddTeacherStep2({required this.email, super.key});

  final GlobalKey<FormBuilderState> _formUserInfo =
      GlobalKey<FormBuilderState>();

  final SiginUpController controller = Get.find<SiginUpController>();
  final LoginController loginController = Get.find<LoginController>();
  final TeacherController teacherController = Get.find<TeacherController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        leading: IconButton(
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
                      Get.to(() => TeacherManagement());
                    },
                  );
                });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.BACKGROUND_COLOR,
          ),
        ),
        backgroundColor: AppColors.SECONDARY_COLOR,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FormBuilder(
            key: _formUserInfo,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'معلومات حساب المعلمة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: AppColors.SECONDARY_COLOR,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'اسم المعلمة',
                  hint: 'ادخل اسم المعلمة',
                  textInputType: TextInputType.text,
                  formName: 'teacherName',
                  validate: (value) {
                    if ((value == null || value.isEmpty)) {
                      return "يرجى عدم ترك هذا الحقل فارغ";
                    }
                    return null;
                  },
                  inputFormat: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                  ],
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'اسم التخصص',
                  hint: 'التخصص...',
                  formName: 'speciallizationName',
                  textInputType: TextInputType.text,
                  isQ: true,
                  validate: (value) {
                    if ((value == null || value.isEmpty)) {
                      return "يرجى عدم ترك هذا الحقل فارغ";
                    }
                    return null;
                  },
                  inputFormat: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                  ],
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'رقم الهوية',
                  hint: 'الرقم...',
                  formName: 'idNumber',
                  textInputType: TextInputType.number,
                  isQ: true,
                  inputFormat: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  maxLength: 9,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'رقم الهاتف',
                  hint: 'ادخل رقم الهاتف',
                  textInputType: TextInputType.number,
                  formName: 'phoneNumber',
                  inputFormat: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  maxLength: 10,
                  validate: (value) {
                    if ((value == null || value.isEmpty)) {
                      return "يرجى عدم ترك هذا الحقل فارغ";
                    }
                    return null;
                  },
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
                        _formUserInfo.currentState!.fields['password']?.value) {
                      return "كلمة المرور غير متطابقة";
                    }
                    return null;
                  },
                  password: true,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: "تأكيد إنشاء الحساب",
                  onPressed: () {
                    if (isValid()) {
                      addUserInfo();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                              headText: 'تم إنشاء الحساب بنجاح !!',
                              bodyText:
                                  'تم إنشاء الحساب بنجاح, سيتم نقلك إلى صفحة تسجيل الدخول للتسجيل باستخدام الحساب الذي أنشأته',
                              ButtonText: 'موافق',
                              onPressed: () {
                                Get.offAll(() => const Home());
                                Get.to(() => TeacherManagement());
                              },
                            );
                          });
                    } else {
                      print(" Signup rejected !! \n");
                    }
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValid() => _formUserInfo.currentState!.saveAndValidate();

  void addUserInfo() async {
    if (!isValid()) return;

    //////////
    User user = User();
    user = User();
    user.name = _formUserInfo.currentState?.value["teacherName"];
    user.password = _formUserInfo.currentState?.value["password"];
    user.mobileNo = _formUserInfo.currentState?.value["phoneNumber"];
    user.email = email;
    user.role = 'teacher';
    user.id = 0;
    user.isActive = true;
    user.userName = email;

    //////////
    controller.teacher.teacherName =
        _formUserInfo.currentState?.value["teacherName"];
    controller.teacher.phoneNumber =
        _formUserInfo.currentState?.value["phoneNumber"];
    controller.teacher.idNumber =
        _formUserInfo.currentState?.value["idNumber"].toString();
    controller.teacher.speciallizationName =
        _formUserInfo.currentState?.value["speciallizationName"];
    controller.teacher.user = user;
    teacherController.addTeacher(controller.teacher.toJson());
    //////////
  }
}
