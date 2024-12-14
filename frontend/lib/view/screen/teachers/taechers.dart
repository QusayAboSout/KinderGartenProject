import 'package:flutter/material.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/view/screen/home/Home.dart';
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
                centerTitle: true,
                title: const Text(
                  'قائمة المعلمات',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.offAll(() => const Home());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              body: Scaffold(
                appBar: AppBar(
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
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: TextField(
                                      controller: searchController,
                                      onChanged: (value) {
                                        controller.filterTeachers(value);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'ابحث عن معلمة...',
                                        hintStyle: TextStyle(
                                            color: AppColors.TEXT_SECONDARY),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.BACKGROUND),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.filter_list_rounded,
                                        size: 30,
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
                  backgroundColor: AppColors.PRIMARY,
                  onPressed: () {
                    Get.to(() => const AddTeacherStep1());
                  },
                  child: const Text(
                    "إضافة معلمة",
                    style: TextStyle(
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
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(
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
          ),
        ),
        trailing: const Icon(
          Icons.star,
        ),
        onTap: () {
          Get.to(() => TeacherProfile(teacherDto: _rowTeacher));
        },
      ),
    );
  }
}
