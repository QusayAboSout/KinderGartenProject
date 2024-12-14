import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/student/students.dart';
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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.home,
                  size: 60,
                ),
              ),
              const SizedBox(height: 10),
              Title(
                color: AppColors.BACKGROUND,
                child: Text(
                  "${classDto.className}",
                  style: const TextStyle(
                      fontSize: 22.3, fontWeight: FontWeight.bold),
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
                    appBar: AppBar(
                      toolbarHeight: 10,
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.BACKGROUND,
                      bottom: const TabBar(
                        indicatorColor: AppColors.TEXT_PRIMARY,
                        labelColor: AppColors.TEXT_PRIMARY,
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
                                          elevation: 3,
                                          margin: const EdgeInsets.all(8),
                                          child: ListTile(
                                              leading: const CircleAvatar(
                                                radius: 22,
                                                child: Icon(
                                                  Icons.menu_book,
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
                              onPressed: () {
                                showModal(context);
                              },
                              child: const Text(
                                "إضافة كتاب",
                                style: TextStyle(
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
                      elevation: 3,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
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
