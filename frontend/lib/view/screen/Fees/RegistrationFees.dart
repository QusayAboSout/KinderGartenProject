import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class RegistrationFees extends StatelessWidget {
  RegistrationFees({super.key});

  final ClassController controller = Get.find<ClassController>();

  //final ClassController controller = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.SECONDARY_COLOR,
          title: const Text('الرسوم العامة'),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const SizedBox(height: 40),
                const Text(
                  'سعر الدفعة العام',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                if (controller.loading)
                  const Padding(padding: EdgeInsets.only(top: 10)),
                if (controller.loading) const CustomLoadingAnimation(),
                const Expanded(
                  child: Text(
                    '200 شيكل',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const SizedBox(height: 40),
                const Divider(thickness: 5),
                const SizedBox(height: 40),
                const Text(
                  'رسوم الحافلة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                if (controller.loading)
                  const Padding(padding: EdgeInsets.only(top: 10)),
                if (controller.loading) const CustomLoadingAnimation(),
                const Expanded(
                  child: Text(
                    '50 شيكل',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
