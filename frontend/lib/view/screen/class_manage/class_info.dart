import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/home/student/students.dart';
import 'package:frontend/view/screen/subject/subjet_with_units.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ClassInfo extends StatelessWidget {
  ClassDto classDto;
  ClassInfo({required this.classDto, super.key}) {
    classSubjectsController = Get.find<ClassSubjectsController>();
    classSubjectsController.claas = classDto;
    classSubjectsController.getClassSubjectss();
    classController.classID = classDto.id;
    classController.getStudentOfTheClass(classDto.id!);
  }

  final ClassController classController = Get.find<ClassController>();
  late ClassSubjectsController classSubjectsController;

  @override
  int numberOfStudent = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: classController,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CircleAvatar(
                backgroundColor: AppColors.LIGHT_TEXT,
                radius: 60,
                child: Icon(
                  Icons.home,
                  size: 60,
                  color: AppColors.LIGHT_TEXT,
                ),
              ),
              const SizedBox(height: 10),
              Title(
                color: AppColors.BACKGROUND_COLOR,
                child: Text(
                  "${classDto.className}",
                  style: const TextStyle(
                      fontSize: 22.3,
                      color: AppColors.LIGHT_TEXT,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<void>(
                future: controller.getClassTeacher(classDto),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CustomLoadingAnimation());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Text(
                      "المعلمة المسؤولة : ${controller.teacher.teacherName ?? 'لا يوجد معلمة'}",
                      style: const TextStyle(fontSize: 17),
                    );
                  }
                },
              ),
              const Text(
                "Number of student : 8",
                style: TextStyle(fontSize: 17),
              ),
              const Divider(
                thickness: 5,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 2,
                  child: Scaffold(
                    backgroundColor: AppColors.BACKGROUND_COLOR,
                    appBar: AppBar(
                      toolbarHeight: 10,
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.BACKGROUND_COLOR,
                      bottom: const TabBar(
                        indicatorColor: AppColors.LIGHT_TEXT,
                        labelColor: AppColors.LIGHT_TEXT,
                        tabs: [
                          Tab(
                              child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  "دفعات الطالب")),
                          Tab(
                              child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  "مواد الصف")),
                          Tab(
                              child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  "طلاب الصف")),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        /////////////////////////////////////////////////////////////////////////////////////////
                        ///////////// $$$$$$ The Money $$$$$ ///////////////////////////////////////////
                        /////////////////////////////////////////////////////////////////////////////////////////
                        const Scaffold(
                          backgroundColor: AppColors.SECONDARY_COLOR,
                          body: Column(
                            children: [
                              Text('Money'),
                            ],
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////////////////////////////
                        ///////////// The Subjects /////////////////////////////////////////////
                        /////////////////////////////////////////////////////////////////////////////////////////
                        Scaffold(
                          backgroundColor: AppColors.SECONDARY_COLOR,
                          body: GetBuilder<ClassSubjectsController>(
                            builder: (controller) => Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        controller.classSubjectsDtos.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if (controller.classSubjectsDtos[index]
                                              .classID ==
                                          classDto.id) {
                                        return Card(
                                          shadowColor: AppColors.LIGHT_TEXT,
                                          elevation: 3,
                                          margin: const EdgeInsets.all(8),
                                          color: AppColors.LIGHT_TEXT,
                                          child: ListTile(
                                              leading: const CircleAvatar(
                                                radius: 22,
                                                backgroundColor:
                                                    AppColors.SECONDARY_COLOR,
                                                child: Icon(
                                                  Icons.menu_book,
                                                  color: AppColors.LIGHT_TEXT,
                                                ),
                                              ),
                                              title: Text(
                                                '${controller.classSubjectsDtos[index].subjectDto?.name}',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: PopupMenuButton<String>(
                                                onSelected: (String value) {
                                                  // Handle menu item selection
                                                  print(
                                                      'Selected option: $value');
                                                },
                                                itemBuilder:
                                                    (BuildContext context) {
                                                  return <PopupMenuEntry<
                                                      String>>[
                                                    PopupMenuItem<String>(
                                                      value: 'delete',
                                                      child: const Text('حذف'),
                                                      onTap: () {
                                                        controller
                                                            .deleteClassSubjects(
                                                                controller
                                                                    .classSubjectsDtos[
                                                                        index]
                                                                    .id);
                                                      },
                                                    ),
                                                  ];
                                                },
                                              ),
                                              onTap: () {
                                                Get.to(
                                                  () => ClassSubjectsInfo(
                                                    controller
                                                            .classSubjectsDtos[
                                                        index],
                                                    classDto,
                                                    subjectDto: controller
                                                            .classSubjectsDtos[
                                                                index]
                                                            .subjectDto
                                                        as SubjectDto,
                                                  ),
                                                );
                                              }),
                                        );
                                      }
                                      return Container();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          floatingActionButton: SizedBox(
                            width: MediaQuery.of(context).size.width * 3 / 10,
                            child: FloatingActionButton(
                              backgroundColor: AppColors.SECONDARY_COLOR,
                              onPressed: () {
                                showModal(context);
                              },
                              child: const Text(
                                "إضافة كتاب",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////////////////////////////
                        ///////////// The Students ///////////////////////////////////////////
                        /////////////////////////////////////////////////////////////////////////////////////////
                        Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: classController.students!.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => StudentCard(
                                  classController.students![index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<SubjectController>(
            builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'قائمة الكتب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.subjects.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Card(
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
                          '${controller.subjects[index].name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.quora_rounded,
                          color: AppColors.LIGHT_TEXT,
                        ),
                        onTap: () {
                          ClassSubjectsDto obj = ClassSubjectsDto();
                          obj.classID = classDto.id;
                          obj.subjectID = controller.subjects[index].id;
                          obj.subjectDto = controller.subjects[index];
                          classSubjectsController
                              .addClassSubjects(obj.toJson());
                        },
                      ),
                    ),
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
