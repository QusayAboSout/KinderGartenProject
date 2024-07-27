import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/Reposetories/AuthReposetory.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/AuthService.dart';
import 'package:frontend/core/services/SendEmailVerificationDto.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/CheckVerificationCodeDto.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/view/screen/teachers/add_teacher_second.dart';
import 'package:get/get.dart';

class SiginupConfirmCodeController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );

  User user = User();
  TeacherDto teacher = TeacherDto();
  bool showProgress = false;
  bool checkCode = true;
  var service = locator<AuthService>();
  var userService = locator<UserServices>();
  var authReposetory = locator<AuthReposetory>();
  var isDoubleEmail = false;
  var error = "";
  var stepKey = false;
  String? email;

  String? code;

  Future CheckEmailCode(BuildContext context) async {
    showProgress = true;
    update(['progress']);
    var checkVerificationCodeDto = CheckVerificationCodeDto(
        email: formKey.currentState!.fields['email']!.value,
        verificationCode: formKey.currentState!.fields['code']!.value);
    var result =
        await service.checkEmailVerificationCode(checkVerificationCodeDto);
    if (result) {
      showProgress = false;
      update(['progress']);
      checkCode = true;
      update(['checkCode']);
      showDialog(
          context: context,
          builder: ((context) {
            return CustomAlertDialog(
              headText: 'تم التحقق من الكود بنجاح :)',
              bodyText:
                  'تم التحقق من الحساب بنجاح سيتم نقلك الى صفحة ادخال المعلومات الاساسية للحساب :)',
              ButtonText: 'موافق',
              onPressed: () {
                Get.to(() => AddTeacherStep2(
                      email: formKey.currentState!.value['email'],
                    ));
              },
            );
          }));
    } else {
      showProgress = false;
      update(['progress']);
      checkCode = false;
      update(['wrongCode']);
      update(['checkCode']);
    }
  }

  void sendEmailCode() async {
    try {
      showProgress = true;
      update(['progress']);
      var sendEmailVerificationDto =
          SendEmailVerificationDto(email: formKey.currentState!.value['email']);
      var result =
          await service.sendEmailVerificationCode(sendEmailVerificationDto);
    } catch (e) {
      print(e);
    }
    showProgress = false;
    update(['progress']);
  }
}
