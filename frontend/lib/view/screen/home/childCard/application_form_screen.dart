import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/view/screen/home/childCard/child_card_row.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({super.key});

  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  bool isEmpty = false;
  final ChildCardController controller = Get.find<ChildCardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildCardController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
        ),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "قائمة طلبات الالتحاق",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.LIGHT_TEXT),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.cards.isNotEmpty
                      ? Column(
                          children: [
                            GetBuilder<ChildCardController>(
                              id: 'progress',
                              builder: (controller) {
                                return Column(
                                  children: [
                                    if (controller.showProgress)
                                      const CustomLoadingAnimation(),
                                  ],
                                );
                              },
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: controller.cards.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var item = controller.cards[index];
                                    return ChildCardRow(item);
                                  }),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            "لا يوجد اي طلب التحاق حتى الان ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHT_TEXT),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
