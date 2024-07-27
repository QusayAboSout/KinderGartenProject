import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/my_students_controller.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/view/screen/home/student/students.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyStudents extends StatelessWidget {
  MyStudents({super.key}) {
    studentController.pagingController = PagingController(firstPageKey: 0);
  }

  StudentController studentController = Get.find<StudentController>();
  @override
  Widget build(BuildContext context) {
    double? sizedBoxHeight = 20;
    return Scaffold(
      backgroundColor: AppColors.SECONDARY_COLOR,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: AppColors.CREMIZON,
        foregroundColor: AppColors.SECONDARY_COLOR,
      ),
      body: FutureBuilder<void>(
          future: studentController.getMyStudents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomLoadingAnimation());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GetBuilder<StudentController>(
                builder: (controller) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(height: sizedBoxHeight),
                        const Text(
                          'طلابي',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.LIGHT_TEXT),
                        ),
                        SizedBox(height: sizedBoxHeight),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Divider(
                            thickness: 3,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: PagedListView<int, StudentDto>(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            pagingController: controller.pagingController,
                            builderDelegate:
                                PagedChildBuilderDelegate<StudentDto>(
                              itemBuilder: (context, item, index) {
                                if (item.userID == Session.user?.id) {
                                  return StudentCard(item);
                                } else {
                                  return const Row();
                                }
                              },
                              noItemsFoundIndicatorBuilder: (_) => Column(
                                children: [
                                  Text(
                                    "لا يوجد طلاب",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
