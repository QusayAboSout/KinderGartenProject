import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/drawer_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/view/screen/Fees/RegistrationFees.dart';
import 'package:frontend/view/screen/class_manage/class_info.dart';
import 'package:frontend/view/screen/home/childCard/application_form_screen.dart';
import 'package:frontend/view/screen/home/student/my_students.dart';
import 'package:frontend/view/screen/home/student/student%20evaluation/final_marks.dart';
import 'package:frontend/view/screen/home/student/students_certificate.dart';
import 'package:frontend/view/screen/subject/subjects.dart';
import 'package:frontend/view/screen/class_manage/classes.dart';
import 'package:frontend/view/screen/home/student/students.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:frontend/view/screen/teachers/taecher.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key}) {
    if (Get.isRegistered<ClassController>()) {
      ClassController controller = Get.find<ClassController>();
    } else {
      ClassController controller = Get.put(ClassController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.LIGHT,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.SECONDARY_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/tom.png'), // Replace with actual user image
                ),
                const SizedBox(height: 8),
                Text(
                  '${Session.user?.name}', // Replace with actual user name
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
            if (Session.user?.role ==
                'admin') // Ensure that Session.user?.role is correctly populated with the user's role
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    customListTile(
                      title: 'ادارة المعلمات',
                      icon: Icons.person_3_rounded,
                      onTap: () {
                        Get.to(() => TeacherManagement());
                      },
                    ),
                    customListTile(
                      title: 'قائمة الطلاب',
                      icon: Icons.people,
                      onTap: () {
                        Get.to(() => StudentListPage());
                      },
                    ),
                    customListTile(
                      title: 'ادارة المواد',
                      icon: Icons.menu_book_rounded,
                      onTap: () {
                        Get.to(() => Subjects());
                      },
                    ),
                    customListTile(
                      title: 'العلامات النهائية',
                      icon: Icons.star_border_outlined,
                      onTap: () {
                        Get.to(() => finalMarksClass());
                      },
                    ),
                    customListTile(
                      title: 'الصفوف',
                      icon: Icons.class_outlined,
                      onTap: () {
                        Get.to(() => Classes());
                      },
                    ),
                  ]),
            if (Session.user?.role == 'teacher')
              GetBuilder<ClassController>(builder: (controller) {
                return FutureBuilder<void>(
                  future: controller.getTeacherClass(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CustomLoadingAnimation());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          customListTile(
                            title: 'الصف',
                            icon: Icons.class_outlined,
                            onTap: () {
                              if (controller.claas.teacherID != null) {
                                Get.to(() =>
                                    ClassInfo(classDto: controller.claas));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return CustomAlertDialog(
                                        headText: 'خطأ',
                                        headColor: AppColors.DANGER,
                                        bodyText:
                                            'لم يتم تحديد الصف المسؤول عنه حتى الان، يرجى اعلام المدير بذلك',
                                        ButtonText: 'مفهوم',
                                        btnColor: AppColors.SECONDARY_COLOR,
                                        onPressed: () {
                                          Get.back();
                                          Get.back();
                                        },
                                      );
                                    }));
                              }
                            },
                          ),
                          customListTile(
                            title: 'العلامات النهائية',
                            icon: Icons.star_border_outlined,
                            onTap: () {
                              if (controller.claas.teacherID != null) {
                                Get.to(
                                  () => FinalMarksStudents(
                                    classDto: controller.claas,
                                  ),
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return CustomAlertDialog(
                                        headText: 'خطأ',
                                        headColor: AppColors.DANGER,
                                        bodyText:
                                            'لم يتم تحديد الصف المسؤول عنه حتى الان، يرجى اعلام المدير بذلك',
                                        ButtonText: 'مفهوم',
                                        btnColor: AppColors.SECONDARY_COLOR,
                                        onPressed: () {
                                          Get.back();
                                          Get.back();
                                        },
                                      );
                                    }));
                              }
                            },
                          ),
                        ],
                      );
                    }
                  },
                );
              }),
            // customListTile(
            //   title: 'الدفعات',
            //   icon: Icons.attach_money_sharp,
            //   onTap: () {
            //     Get.to(() => RegistrationFees());
            //   },
            // ),
            customListTile(
              title: 'طلبات الالتحاق',
              icon: Icons.file_copy_rounded,
              onTap: () {
                Get.to(() => const ApplicationFormScreen());
              },
            ),
            customListTile(
              title: 'طلابي',
              icon: Icons.family_restroom,
              onTap: () {
                Get.to(() => MyStudents());
              },
            ),
            // customListTile(
            //   title: 'الإعدادات',
            //   icon: Icons.settings,
            //   onTap: () {},
            // ),
            customListTile(
                title: 'تسجيل خروج',
                icon: Icons.logout,
                onTap: () {
                  Session.user = null;
                  Get.offAll(() =>  Login());
                })
          ]),
        ],
      ),
    );
  }
}

class customListTile extends StatelessWidget {
  late String title;
  Widget? subTitle;
  IconData icon;
  GestureTapCallback onTap;
  customListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.LIGHT_TEXT),
      ),
      leading: Icon(
        icon,
        color: AppColors.LIGHT_TEXT,
      ),
      onTap: onTap,
      subtitle: subTitle,
    );
  }
}
