import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:frontend/view/screen/teachers/add_teacher.dart';
import 'package:frontend/view/screen/teachers/add_teacher_first.dart';
import 'package:frontend/view/screen/teachers/teacher_profile.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class TeacherManagement extends StatelessWidget {
  TeacherManagement({super.key});

  // final TeacherController controller = Get.find<TeacherController>();
  final TeacherController controller = Get.put(TeacherController());
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
        init: controller,
        builder: (controller) => Scaffold(
              appBar: AppBar(
                foregroundColor: AppColors.SECONDARY_COLOR,
                backgroundColor: AppColors.PINK,
                centerTitle: true,
                title: const Text(
                  'قائمة المعلمات',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.LIGHT),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.offAll(() => const Home());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.SECONDARY_COLOR,
                  ),
                ),
              ),
              backgroundColor: AppColors.BACKGROUND_COLOR,
              body: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.BLUE,
                  toolbarHeight: 100,
                  automaticallyImplyLeading: false,
                  actions: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 35,
                                      color: AppColors.LIGHT,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.SECONDARY_COLOR,
                                            width: 2),
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: (value) {
                                          controller.filterTeachers(value);
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'ابحث عن معلمة...',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  244, 241, 241, 0.944)),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        style: const TextStyle(
                                            color: AppColors.SECONDARY_COLOR),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: AppColors.SECONDARY_COLOR,
                                          width: 2),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.filter_list_rounded,
                                        size: 30,
                                        color: AppColors.LIGHT,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Container(
                  color: AppColors.BLUE,
                  child: Column(
                    children: [
                      if (controller.loading)
                        const Padding(padding: EdgeInsets.only(top: 10)),
                      if (controller.loading) const CustomLoadingAnimation(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchController.text.isEmpty
                              ? controller.teachers.length
                              : controller.filteredTeachers.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TeacherRow(
                            searchController.text.isEmpty
                                ? controller.teachers[index]
                                : controller.filteredTeachers[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: SizedBox(
                width: MediaQuery.of(context).size.width * 3 / 10,
                child: FloatingActionButton(
                  backgroundColor: AppColors.SECONDARY_COLOR,
                  onPressed: () {
                    Get.to(() => const AddTeacherStep1());
                  },
                  child: const Text(
                    "إضافة معلمة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
  }
}

class TeacherRow extends StatelessWidget {
  TeacherRow(this._rowTeacher, {super.key});

  final TeacherDto _rowTeacher;
  final TeacherController controller = Get.find<TeacherController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT,
      child: ListTile(
        leading: const Icon(
          color: AppColors.BACKGROUND_COLOR,
          Icons.account_circle_rounded, // Specify the desired icon
          size: 50, // Adjust the size of the icon
        ),
        title: Text(
          'المعلمة : ${_rowTeacher.teacherName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'التخصص : ${_rowTeacher.speciallizationName}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        trailing: const Icon(
          Icons.star,
          color: AppColors.LIGHT_TEXT,
        ),
        onTap: () {
          Get.to(() => TeacherProfile(teacherDto: _rowTeacher));
        },
      ),
    );
  }
}
