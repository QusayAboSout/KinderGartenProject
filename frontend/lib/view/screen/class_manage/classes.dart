import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/view/screen/class_manage/add_class.dart';
import 'package:frontend/view/screen/class_manage/class_row.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class Classes extends StatelessWidget {
  Classes({super.key});

  final ClassController controller = Get.find<ClassController>();

  //final ClassController controller = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
          title: const Text(
            'الصفوف',
            style: TextStyle(color: AppColors.LIGHT_TEXT),
          ),
        ),
        body: Column(
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
                    ClassRow(controller.clacess[index]),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 10,
          child: FloatingActionButton(
            backgroundColor: AppColors.CREMIZON,
            onPressed: () {
              Get.to(() => const AddClass());
            },
            child: const Text(
              "إضافة صف",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHT_TEXT),
            ),
          ),
        ),
      ),
    );
  }
}

