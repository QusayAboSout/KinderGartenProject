import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/student_ctrl/current_students_controller.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/view/screen/home/student/student_profile.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudentListPage extends StatefulWidget {
  StudentListPage({super.key}) {
    // studentController.classID = null;
  }

  final StudentController studentController = Get.put(StudentController());
  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final StudentController studentController = Get.put(StudentController());

  final ClassController classController = Get.find<ClassController>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(
      init: studentController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
          centerTitle: true,
          title: const Text(
            'قائمة الطلاب',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.LIGHT_TEXT,
            ),
          ),
        ),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.BACKGROUND_COLOR,
                      actions: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 35,
                                      color: AppColors.LIGHT_TEXT,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.62,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: AppColors.SECONDARY_COLOR,
                                          width: 2,
                                        ),
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Trigger rebuild to apply filtering
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'ابحث عن طالب...',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  211, 248, 247, 247)),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        style: const TextStyle(
                                            color: AppColors.LIGHT_TEXT),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: AppColors.SECONDARY_COLOR,
                                        width: 2,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.filter_list_rounded,
                                        size: 30,
                                        color: AppColors.LIGHT_TEXT,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                      toolbarHeight: 70,
                      bottom: const TabBar(
                        labelColor: AppColors.LIGHT_TEXT,
                        indicatorColor: AppColors.LIGHT_TEXT,
                        tabs: [
                          Tab(
                            child: Text(
                              "طلاب الفصول السابقة",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.LIGHT_TEXT,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "طلاب الفصل الحالي",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.LIGHT_TEXT,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: Container(
                      color: AppColors.SECONDARY_COLOR,
                      child: TabBarView(
                        children: [
                          // Column for old students
                          Column(
                            children: [
                              if (controller.loading)
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                              if (controller.loading)
                                const CustomLoadingAnimation(),
                              Expanded(
                                child: GetBuilder<StudentController>(
                                  builder: (controller) {
                                    return PagedListView<int, StudentDto>(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      pagingController:
                                          controller.pagingController,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<StudentDto>(
                                        itemBuilder: (context, item, index) {
                                          if (searchController
                                              .text.isNotEmpty) {
                                            if (item.studentName!.contains(
                                                searchController.text)) {
                                              return StudentCard(item);
                                            }
                                          } else if (searchController
                                              .text.isEmpty) {
                                            return StudentCard(item);
                                          }
                                          return Container();
                                        },
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            Column(
                                          children: [
                                            Text(
                                              "لا يوجد طلاب",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          // Column for current students
                          Column(
                            children: [
                              if (controller.loading)
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                              if (controller.loading)
                                const CustomLoadingAnimation(),
                              Expanded(
                                child: GetBuilder<CurrentStudentController>(
                                  builder: (controller) {
                                    return PagedListView<int, StudentDto>(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      pagingController:
                                          controller.pagingController,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<StudentDto>(
                                        itemBuilder: (context, item, index) {
                                          if (searchController
                                              .text.isNotEmpty) {
                                            if (item.studentName!.contains(
                                                searchController.text)) {
                                              return StudentCard(item);
                                            }
                                          } else if (searchController
                                              .text.isEmpty) {
                                            return StudentCard(item);
                                          }
                                          return Container();
                                        },
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            Column(
                                          children: [
                                            Text(
                                              "لا يوجد طلاب",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}

class StudentCard extends StatelessWidget {
  StudentCard(this._rowStudent, {super.key});

  final StudentDto _rowStudent;
  final StudentController studentController = Get.put(StudentController());
  final ClassController classController = Get.find<ClassController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT_TEXT,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppColors.SECONDARY_COLOR,
          child: Icon(
            color: AppColors.LIGHT_TEXT,
            Icons.person, // Specify the desired icon
          ),
        ),
        title: Text(
          '${_rowStudent.studentName}',
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
          Get.to(() => StudentProfile(
                studentDto: _rowStudent,
              ));
        },
        onLongPress: () {
          if (Session.user?.role == 'admin') {
            showModal(context);
          }
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<ClassController>(
          builder: (controller) => Column(
            children: [
              if (controller.loading)
                const Padding(padding: EdgeInsets.only(top: 10)),
              if (controller.loading) const CustomLoadingAnimation(),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.clacess.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ClassRowModal(controller.clacess[index], _rowStudent),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ClassRowModal extends StatelessWidget {
  ClassRowModal(this._rowClass, this._rowStudent, {super.key});

  final ClassDto _rowClass;
  final StudentDto _rowStudent;
  final ClassController classController = Get.find<ClassController>();
  final StudentController studentController = Get.find<StudentController>();

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
          final Map<String, dynamic> value = <String, dynamic>{};
          _rowStudent.classID = _rowClass.id;
          value.addAll(_rowStudent.toJson());
          studentController.updateStudent(_rowStudent, value);
        },
      ),
    );
  }
}
