import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/AuthService.dart';
import 'package:frontend/core/services/SendEmailVerificationDto.dart';
import 'package:frontend/core/services/teacher_services.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/CheckVerificationCodeDto.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/view/screen/teachers/add_teacher_second.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool loading = false;
  bool showProgress = false;
  bool isDoubleEmail = false;
  bool checkCode = true;
  bool enableButton = true;
  var teacher = TeacherDto();
  final TeacherPaginationResult _teacherPaginationResult =
      TeacherPaginationResult(data: []);
  List<TeacherDto> teachers = [];
  List<TeacherDto> filteredTeachers = [];

  var service = locator<TeacherServices>();
  var authService = locator<AuthService>();
  var userService = locator<UserServices>();

  var error = "";

  @override
  void onInit() async {
    super.onInit();
    await getTeachers();
  }

  Future getTeachers() async {
    try {
      loading = true;
      _teacherPaginationResult.data = await service.getTeachers();
      if (_teacherPaginationResult.data != null) {
        teachers = _teacherPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addTeacher(Map<String, dynamic> value) async {
    try {
      var teacher = TeacherDto.fromJson(value);
      teacher = await service.addTeacher(teacher);
      // pagingController.refresh();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getTeachers();
  }

  updateTeacher(TeacherDto old, Map<String, dynamic> value) async {
    var std = TeacherDto.fromJson(value);
    std.id = old.id;

    std = await service.updateTeacher(std);
    refresh();
    update();
    getTeachers();
  }

  void filterTeachers(String query) {
    // Clear the previous filtered list
    filteredTeachers.clear();

    // If the query is empty, show all teachers
    if (query.isEmpty) {
      filteredTeachers.addAll(teachers);
      return;
    }

    // Filter teachers whose names contain the query
    filteredTeachers.addAll(teachers.where((teacher) =>
        teacher.teacherName!.toLowerCase().contains(query.toLowerCase())));

    // Update UI
    update();
  }

  void CheckEmailVerificationCode(GlobalKey<FormBuilderState> formKey) async {
    loading = true;
    String? email = formKey.currentState!.value['email'];
    String? code = formKey.currentState!.value['code'];

    var checkVerficationCodeDto =
        CheckVerificationCodeDto(email: email, verificationCode: code);

    var result =
        authService.checkEmailVerificationCode(checkVerficationCodeDto);

    print("The answer is : $result !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    loading = false;
    // controller.checkCode = check;
  }

  Future CheckEmailCode(BuildContext context) async {
    showProgress = true;
    update(['progress']);
    var checkVerificationCodeDto = CheckVerificationCodeDto(
        email: formKey.currentState!.value['email'],
        verificationCode: formKey.currentState!.value['code']);
    var result =
        await authService.checkEmailVerificationCode(checkVerificationCodeDto);
    if (result) {
      showProgress = false;
      update(['progress']);
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
    }
  }

  void sendEmailCode() async {
    try {
      var sendEmailVerificationDto =
          SendEmailVerificationDto(email: formKey.currentState!.value['email']);
      var result =
          await authService.sendEmailVerificationCode(sendEmailVerificationDto);
    } catch (e) {
      print(e);
    }
    enableButton = false;
    update(['enableButton']);
  }

  Future CheckDoublicateEmail(String? email) async {
    var users = await userService.getUsers();
    for (var ele in users) {
      if (ele.email == email) {
        showProgress = false;
        update(['progress']);
        isDoubleEmail = true;
        update(['doubleEmail']);
        return;
      }
    }
    showProgress = false;
    update(['progress']);
    isDoubleEmail = false;
    update(['doubleEmail']);
    return;
  }
}
