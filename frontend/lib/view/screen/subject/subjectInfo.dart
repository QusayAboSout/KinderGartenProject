import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/units/add_units.dart';
import 'package:frontend/view/screen/units/unit.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubjectInfo extends StatelessWidget {
  final SubjectDto subjectDto;
  final ClassSubjectsDto? classSubjectsDto;
  SubjectInfo(this.classSubjectsDto, {required this.subjectDto, super.key}) {
    unitController.getUnitsSubject(subjectDto.id);
  }

  final SubjectController subjectController = Get.find<SubjectController>();
  final UnitController unitController = Get.find<UnitController>();
  final ClassController classController = Get.find<ClassController>();
  // subject 
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
                backgroundColor: AppColors.CREMIZON,
                radius: 60,
                child: Icon(
                  Icons.home,
                  color: AppColors.LIGHT_TEXT,
                  size: 60,
                ),
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
              // const Text(
              //   "المدرس",
              //   style: TextStyle(fontSize: 17),
              // ),
              const Divider(
                thickness: 5,
              ),
              Expanded(
                  child: DefaultTabController(
                length: 1,
                initialIndex: 0,
                child: Scaffold(
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
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                "دروس الكتاب")),
                      ],
                    ),
                  ),
                  body: Container(
                    color: AppColors.SECONDARY_COLOR,
                    child: TabBarView(
                      children: [
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
                ),
              )),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 10,
          child: FloatingActionButton(
            backgroundColor: AppColors.CREMIZON,
            onPressed: () {
              Get.to(() => AddUnits(subjectDto));
            },
            child: const Text(
              "إضافة درس",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.LIGHT_TEXT
              ),
            ),
          ),
        ),
      ),
    );
  }
}