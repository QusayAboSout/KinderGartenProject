//flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Reposetories/AuthReposetory.dart';
import 'package:frontend/core/services/AuthService.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/auth.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/login.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ScrollController scrollController = ScrollController();
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );
  var authReposetory = locator<AuthReposetory>();
  var loading = false;
  var authService = locator<AuthService>();
  var userService = locator<UserServices>();

  var passwordFaild = false;
  var error = "";
  var loginDto = LoginDto();
  var successLogin = false;
  var isPass;

  void setAgree() {
    update();
  }

  Future login() async {
    try {
      successLogin = true;
      print('test >>>>> 1 <<<<<');
      var result = await authService.login(loginDto);
      loading = false;
      print('test >>>>> 2 <<<<<');
      var auth = Auth(token: result.authToken, userId: result.userID);
      var insertResult = await authReposetory.insertData(auth);
      // await Get.delete<SplashController>();
      // Get.offAll(() => Home(), routeName: "Home");
      var data = await authReposetory.getAuth();
      if (data == null) {
        Get.off(() => login());
      } else {
        Session.token = data.token;
        Session.user = await userService.getUserById(result.userID!);
        Get.offAll(() => const Home());
      }
      update();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      print('test >>>>> 3 <<<<<');
      update();
      refresh();
      loading = false;
    }
  }
}
