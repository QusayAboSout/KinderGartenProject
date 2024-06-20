import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/Reposetories/AuthReposetory.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/AuthService.dart';
import 'package:frontend/core/services/SendEmailVerificationDto.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/CheckVerificationCodeDto.dart';
import 'package:frontend/model/auth.dart';
import 'package:frontend/model/authentication_dto.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/sigin_up.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/view/screen/teachers/add_teacher_second.dart';
import 'package:get/get.dart';

class SiginUpController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> confirmCodeKey =
      GlobalKey<FormBuilderState>();
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
        email: confirmCodeKey.currentState!.value['email'],
        verificationCode: confirmCodeKey.currentState!.value['code']);
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

  Future CheckDoublicateEmail(String? email) async {
    showProgress = true;
    update(['progress']);
    var users = await userService.getUsers();
    for (var ele in users) {
      if (ele.email == email) {
        isDoubleEmail = true;
        update(['doubleEmail']);
        showProgress = false;
        update(['progress']);
        return;
      }
    }
    showProgress = false;
    update(['progress']);
    isDoubleEmail = false;
    update(['checkDoublicateEmail']);
    return;
  }

  Future<AuthenticationDto> siginUp() async {
    user.id = 0;
    user.isActive = true;
    user.userName = user.email;
    var siginUpDto = SiginUpDto(user: user, code: code);
    print(siginUpDto);
    var result = await service.SiginUp(siginUpDto);
    var auth = Auth(token: result.authToken, userId: result.userID);
    await authReposetory.insertData(auth);
    return result;
  }
}
