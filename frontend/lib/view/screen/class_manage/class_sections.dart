import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/section_controller.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'الشعبة',
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
                      elevation: 3,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.home,
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
            onPressed: () {
              // Get.to(() => const AddClass());
            },
            child: const Text(
              "إضافة شعبة",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
