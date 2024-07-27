import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class TeacherProfile extends StatelessWidget {
  TeacherDto teacherDto;
  TeacherProfile({required this.teacherDto, super.key});
  Future<void> _loadData() async {
    await classController.getTeacherClassInfo(teacherDto.id);
  }

  final TeacherController teacherController = Get.put(TeacherController());
  final ClassController classController = Get.find<ClassController>();
  double? fsize = 20;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomLoadingAnimation());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GetBuilder<TeacherController>(
              init: teacherController,
              builder: (controller) => Scaffold(
                backgroundColor: AppColors.BACKGROUND_COLOR,
                appBar: AppBar(
                  title: const Text(
                    'ملف الشخصي للمعلمة',
                    style: TextStyle(color: AppColors.LIGHT_TEXT),
                  ),
                  backgroundColor: AppColors.CREMIZON,
                  foregroundColor: AppColors.SECONDARY_COLOR,
                  centerTitle: true,
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          child: Icon(
                            Icons.girl,
                            size: 120,
                            color: AppColors.LIGHT_TEXT,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'اسم المعلمة : ${teacherDto.teacherName}',
                          style: TextStyle(
                              fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'اسم التخصص : ${teacherDto.speciallizationName}',
                          style: TextStyle(
                              fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Divider(thickness: 5),
                        ////////////////////
                        ////////////////////
                        ////////////////////
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.email),
                            Text(
                              '${teacherDto.user?.email}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.phone),
                            Text(
                              '${teacherDto.phoneNumber}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.school),
                            Text(
                              'اسم الصف : ${classController.claas.className ?? "غير مصنف"}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.person),
                            Text(
                              'رقم الهوية : ${teacherDto.idNumber}',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                            text: "تعديل المعلومات",
                            onPressed: () {
                              showModal(context);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ما الذي ترغب في تعديله ؟',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('اسم المعلمة'),
                onTap: () {
                  // Handle question 1 tap
                },
              ),
              ListTile(
                title: const Text('رقم الهوية'),
                onTap: () {
                  // Handle question 2 tap
                },
              ),
              ListTile(
                title: const Text('رقم الهاتف'),
                onTap: () {
                  // Handle question 3 tap
                },
              ),
              ListTile(
                title: const Text('الصف المسؤولة عنه'),
                onTap: () {
                  showModal2(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showModal2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<ClassController>(
            builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'أختر الصف الذي ترغب بأن تشرف عليه المعلمة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.clacess.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ClassRowModalTeacher(
                        controller.clacess[index], teacherDto),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ClassRowModalTeacher extends StatelessWidget {
  ClassRowModalTeacher(this._rowClass, this._rowTeacher, {super.key});

  final ClassDto _rowClass;
  final TeacherDto _rowTeacher;

  final ClassController classController = Get.find<ClassController>();

  final TeacherController teacherController = Get.find<TeacherController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.SECONDARY_COLOR,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.LIGHT_TEXT,
        ),
        title: Text(
          '${_rowClass.className}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${_rowClass.classYear}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        trailing: const Icon(
          Icons.quora_rounded,
          color: AppColors.LIGHT_TEXT,
        ),
        onTap: () {
          if (classController.claas.teacherID != null) {
            showDialog(
                context: context,
                builder: ((context) {
                  return CustomAlertDialog(
                    headText: 'تحذير',
                    headColor: AppColors.DANGER,
                    bodyText:
                        'سيصبح هذا الصف من دون معلم، هل ترغب بتأكيد تغيير الصف ؟',
                    ButtonText: 'موافق',
                    btnColor: AppColors.SECONDARY_COLOR,
                    onPressed: () {
                      final Map<String, dynamic> currentClassValue =
                          <String, dynamic>{};
                      ClassDto classNow = classController.claas;
                      classNow.teacherID = null;
                      currentClassValue.addAll(classNow.toJson());
                      classController.updateClass(classNow, currentClassValue);
                      ////////////
                      final Map<String, dynamic> classValue =
                          <String, dynamic>{};
                      _rowClass.teacherID = _rowTeacher.id;
                      classValue.addAll(_rowClass.toJson());
                      classController.updateClass(_rowClass, classValue);
                    },
                  );
                }));
          } else if (_rowClass.teacherID != null) {
            showDialog(
                context: context,
                builder: ((context) {
                  return CustomAlertDialog(
                    headText: 'خطأ',
                    headColor: AppColors.DANGER,
                    bodyText:
                        'الصف الذي ترغب بان يصبح المسؤول عنه هذا المدارس يحتوي بالفعل على مدرس مسؤول عنه',
                    ButtonText: 'مفهوم',
                    btnColor: AppColors.SECONDARY_COLOR,
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                  );
                }));
          } else {
            final Map<String, dynamic> classValue = <String, dynamic>{};
            _rowClass.teacherID = _rowTeacher.id;
            classValue.addAll(_rowClass.toJson());
            classController.updateClass(_rowClass, classValue);
            classController.refresh();
            classController.update();
          }
        },
      ),
    );
  }
}
