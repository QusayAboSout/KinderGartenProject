import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/home/student/student%20evaluation/student_evaluation.dart';
import 'package:frontend/view/screen/units/unit.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ClassSubjectsInfo extends StatelessWidget {
  final SubjectDto subjectDto;
  final ClassDto? classDto;
  final ClassSubjectsDto? classSubjectsDto;
  ClassSubjectsInfo(this.classSubjectsDto, this.classDto,
      {required this.subjectDto, super.key}) {
    unitController.getUnitsSubject(subjectDto.id);
    classController.getStudentOfTheClass(classDto!.id!);
  }

  final SubjectController subjectController = Get.find<SubjectController>();
  final UnitController unitController = Get.find<UnitController>();
  final ClassController classController = Get.find<ClassController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectController>(
      init: subjectController,
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
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/tom.png'), // Replace with actual user image
              ),
              const SizedBox(height: 10),
              Title(
                color: AppColors.BACKGROUND_COLOR,
                child: Text(
                  "${subjectDto.name}",
                  style: const TextStyle(
                      fontSize: 22.3,
                      color: AppColors.LIGHT_TEXT,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "المدرس : كل المعلمات",
                style: TextStyle(fontSize: 17),
              ),
              const Text(
                "عدد الدروس : 4",
                style: TextStyle(fontSize: 17),
              ),
              const Text(
                "الصف : كل الصفوف",
                style: TextStyle(fontSize: 17),
              ),
              const Divider(
                thickness: 5,
              ),
              Expanded(
                  child: DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: Scaffold(
                  backgroundColor: AppColors.BACKGROUND_COLOR,
                  appBar: AppBar(
                    toolbarHeight: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.BACKGROUND_COLOR,
                    bottom: const TabBar(
                      indicatorColor: AppColors.LIGHT_TEXT,
                      labelColor: AppColors.LIGHT_TEXT,
                      tabs: [
                        Tab(
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              "تقييم الطلاب"),
                        ),
                        Tab(
                            child: Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                "دروس الكتاب")),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Column(
                        children: [
                          if (controller.loading)
                            const Padding(padding: EdgeInsets.only(top: 10)),
                          if (controller.loading)
                            const CustomLoadingAnimation(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: classController.students!.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => StudentMarks(
                                classDto!,
                                subjectDto,
                                classController.students![index],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UnitController>(
                        builder: (controller) => Column(children: [
                          if (controller.loading)
                            const Padding(padding: EdgeInsets.only(top: 10)),
                          if (controller.loading)
                            const CustomLoadingAnimation(),
                          Expanded(
                            child: ListView.builder(
                                itemCount: controller.subjectUnits.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return UnitRow(
                                    controller.subjectUnits[index],
                                    subjectDto,
                                  );
                                }),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
