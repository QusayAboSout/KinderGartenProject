import 'package:flutter/material.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/view/screen/home/student/students_certificate.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class StudentProfile extends StatelessWidget {
  StudentDto studentDto;
  StudentProfile({required this.studentDto, super.key});

  final StudentController controller = Get.find<StudentController>();
  Future<void> _loadData() async {
    if (studentDto.classID != null) {
      await controller.getMyStudentClass(studentDto);
    }
   await controller.getChildCardOfStudent(studentDto.childCardID!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomLoadingAnimation());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GetBuilder<StudentController>(
            init: controller,
            builder: (controller) {
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/tom.png'),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        ' اسم الطالب : ${studentDto.studentName}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        ' صف الطالب : ${studentDto.classID != null ? controller.studentClass : 'غير مصنف'}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (controller.haveBirth)
                        Text(
                          'العمر : ${calculateAge(DateTime.parse(controller.childCardDto.birthOfDate!.replaceAll('/', '-')))}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        const Row(),
                      const SizedBox(height: 16),
                      Text(
                        'رقم ولي الأمر : ${controller.childCardDto.phoneNumber ?? 'لا يوجد'}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'أداء الطالب',
                        onPressed: () {
                          if (studentDto.classID == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog(
                                  headText: 'خطأ',
                                  headColor: AppColors.DANGER,
                                  bodyText:
                                      'لم يتم إضافة هذا الطالب إلى صف حتى الان',
                                  ButtonText: 'مفهوم',
                                  btnColor: AppColors.SECONDARY_COLOR,
                                  onPressed: () {
                                    Get.back();
                                  },
                                );
                              },
                            );
                          } else {
                            Get.to(() =>
                                StudentCertificate(studentDto: studentDto));
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  int calculateAge(DateTime birthDate) {
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
