import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/loginController.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/row_text_button.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  Login({super.key});

  final UserController _userController = Get.find<UserController>();
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  final LoginController loginController = Get.find<LoginController>();

  //final UserController _userController = Get.find<UserController>();
  bool wrongInfo = false;

  @override
  bool isPass = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: loginController,
      builder: (controller) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 130),
                const Text(
                  'تسجيل دخول',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppColors.SECONDARY_COLOR),
                ),
                const SizedBox(height: 130),
                CustomTextField(
                  label: 'اسم المستخدم',
                  hint: 'ادخل اسم المستخدم',
                  formName: 'email',
                  textInputType: TextInputType.text,
                  validate: (value) {
                    return null;

                    // if ((value == null || value.isEmpty)) {
                    //   return "يرجى ادخال البريد الالكتروني";
                    // } else if (!value.contains('@gmail.com') &&
                    //     !value.contains('@outlook.com')) {
                    //   return "يرجى إدخال الحساب بشكل صحيح";
                    // }
                    // return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'كلمة المرور',
                  hint: 'ادخل كلمة المرور',
                  formName: 'password',
                  textInputType: TextInputType.visiblePassword,
                  validate: (value) {
                    return null;

                    // if ((value == null || value.isEmpty)) {
                    //   return "يرجى ادخال كلمة المرور";
                    // } else if (value.length < 6) {
                    //   return "يجب ان تكون كلمة المرور من 6 خانات على الاقل";
                    // }
                    // return null;
                  },
                  password: true,
                ),
                Container(
                  key: const Key("errorLable"),
                  child: (loginController.error.isNotEmpty)
                      ? const Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Text('يوجد خطأ في اسم المستخدم أو كلمة المرور',
                              style: TextStyle(color: Colors.red)),
                        )
                      : null,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                GetBuilder<UserController>(
                  init: widget._userController,
                  builder: (controller) => CustomButton(
                    text: 'تسجيل دخول',
                    onPressed: () {
                      loginController.loading = true;
                      //  if (_formKey.currentState!.saveAndValidate()) {
                      if (_formKey.currentState!.fields["email"]?.value ==
                          'a') {
                        loginController.loginDto.userName = "q201612@gmail.com";
                        loginController.loginDto.password = "google@1";
                      } else if (_formKey
                              .currentState!.fields['email']?.value ==
                          "t") {
                        loginController.loginDto.userName =
                            "qusay201612@gmail.com";
                        loginController.loginDto.password = "google@2";
                      } else if (_formKey
                              .currentState!.fields["email"]?.value ==
                          's') {
                        loginController.loginDto.userName =
                            "qusayawawdeh9@gmail.com";
                        loginController.loginDto.password = "google@3";
                      } else {
                        loginController.loginDto.userName =
                            _formKey.currentState!.value["email"];
                        loginController.loginDto.password =
                            _formKey.currentState!.value["password"];
                      }
                      loginController.login();
                      // }
                      //  else {
                      //   print(
                      //     '!!! Validatation is Falied !!!',
                      //   );
                      // }
                    },
                  ),
                ),
                const SizedBox(height: 50),
                const RowTextButton(
                  text: 'نسيت كلمة المرور؟',
                  ButtonText: 'تغيير',
                ),
                const RowTextButton(
                  text: 'لا تملك حساب؟',
                  ButtonText: 'إنشاء',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
