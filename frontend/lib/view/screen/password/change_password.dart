import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key});

  final SiginUpController controller =
      Get.find<SiginUpController>();

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: ,
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Center(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 130),
                const Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: AppColors.SECONDARY_COLOR),
                ),
                const SizedBox(height: 130),
                CustomTextField(
                  label: 'كلمة المرور الجديدة',
                  hint: 'ادخل كلمة المرور الجديدة',
                  formName: 'newPassword',
                  textInputType: TextInputType.visiblePassword,
                  validate: (value) {
                    if ((value == null || value.isEmpty)) {
                      return "يرجى ادخال كلمة المرور";
                    } else if (value.length < 6) {
                      return "يجب ان تكون كلمة المرور من 6 خانات على الاقل";
                    }
                    return null;
                  },
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
                        _formKey.currentState!.fields['newPassword']?.value) {
                      return "كلمة المرور غير متطابقة";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'تأكيد',
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                    } else {
                      print(
                        '!!! Change Password Is Failed !!!',
                      );
                    }
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
