import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/section_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ClassSections extends StatelessWidget {
  ClassSections({super.key});

  final SectionController controller = Get.find<SectionController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.SECONDARY,
          foregroundColor: AppColors.PRIMARY,
          title: const Text(
            'الشعبة',
            style: TextStyle(color: AppColors.TEXT_PRIMARY),
          ),
        ),
        body: Column(
          children: [
            if (controller.loading)
              const Padding(padding: EdgeInsets.only(top: 10)),
            if (controller.loading) const CustomLoadingAnimation(),
            Expanded(
              child: ListView.builder(
                itemCount: controller.Sections.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = controller.Sections[index];
                  return GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Card(
                      shadowColor: AppColors.TEXT_PRIMARY,
                      elevation: 3,
                      margin: const EdgeInsets.all(8),
                      color: AppColors.PRIMARY,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const CircleAvatar(
                              backgroundColor: AppColors.TEXT_PRIMARY,
                              radius: 30,
                              child: Icon(
                                Icons.home,
                                color: AppColors.TEXT_PRIMARY,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${item.name}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 10,
          child: FloatingActionButton(
            backgroundColor: AppColors.PRIMARY,
            onPressed: () {
              // Get.to(() => const AddClass());
            },
            child: const Text(
              "إضافة شعبة",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.TEXT_PRIMARY),
            ),
          ),
        ),
      ),
    );
  }
}
