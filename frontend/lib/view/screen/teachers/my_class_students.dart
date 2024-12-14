import 'package:flutter/material.dart';
import 'package:frontend/controller/student_ctrl/my_class_student_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/view/screen/student/students.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class MyClassStudents extends StatefulWidget {
  const MyClassStudents({super.key});
  @override
  State<MyClassStudents> createState() => _MyClassStudentsState();
}

class _MyClassStudentsState extends State<MyClassStudents> {
  final TextEditingController searchController = TextEditingController();
  final MyClassStudentsController controller =
      Get.find<MyClassStudentsController>();

  Future<void> _loadData() async {
    controller.getMyClassStudents();
    controller.isHaveClass();
  }

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
            return GetBuilder<MyClassStudentsController>(
              init: controller,
              builder: (controller) => Scaffold(
                appBar: AppBar(
                  toolbarHeight: 50,
                  backgroundColor: AppColors.SECONDARY,
                  foregroundColor: AppColors.PRIMARY,
                  centerTitle: true,
                  title: const Text(
                    'قائمة الطلاب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.TEXT_PRIMARY,
                    ),
                  ),
                ),
                backgroundColor: AppColors.BACKGROUND,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: DefaultTabController(
                          length: 1,
                          child: Scaffold(
                              appBar: AppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: AppColors.BACKGROUND,
                                actions: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.search,
                                                size: 35,
                                                color: AppColors.TEXT_PRIMARY,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.62,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppColors.PRIMARY,
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
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'ابحث عن طالب...',
                                                    hintStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            211,
                                                            248,
                                                            247,
                                                            247)),
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                  ),
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .TEXT_PRIMARY),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: AppColors.PRIMARY,
                                                  width: 2,
                                                ),
                                              ),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.filter_list_rounded,
                                                  size: 30,
                                                  color: AppColors.TEXT_PRIMARY,
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
                                  labelColor: AppColors.TEXT_PRIMARY,
                                  indicatorColor: AppColors.TEXT_PRIMARY,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "طلاب الصف",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.TEXT_PRIMARY,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              body: controller.isHave == true
                                  ? Container(
                                      color: AppColors.PRIMARY,
                                      child: TabBarView(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  controller.students.length,
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                if (controller
                                                    .students.isEmpty) {
                                                  return const Text(
                                                      "لا يوجد طلاب حتى الان");
                                                } else {
                                                  var item = controller
                                                      .students[index];
                                                  return StudentCard(item);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: AppColors.PRIMARY,
                                      child: const Center(
                                        child: Text(
                                          "لست مسؤول عن صف حتى الان",
                                          style: TextStyle(
                                              color: AppColors.TEXT_PRIMARY,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
