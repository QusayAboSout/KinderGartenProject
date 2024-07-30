import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/subject/add_subject.dart';
import 'package:frontend/view/screen/subject/subjectInfo.dart';
import 'package:frontend/view/screen/units/add_units.dart';
import 'package:frontend/view/screen/units/unit.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class Subjects extends StatelessWidget {
  Subjects({super.key});

  final SubjectController subjectController = Get.find<SubjectController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SECONDARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColors.SECONDARY_COLOR,
        backgroundColor: AppColors.CREMIZON,
        title: const Text(
          'إدارة المواد',
          style: TextStyle(color: AppColors.LIGHT_TEXT),
        ),
      ),
      body: GetBuilder<SubjectController>(
        init: subjectController,
        builder: (controller) => Column(
          children: [
            if (controller.loading)
              const Padding(padding: EdgeInsets.only(top: 30)),
            if (controller.loading) const CustomLoadingAnimation(),
            Expanded(
              child: ListView.builder(
                itemCount: controller.subjects.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    SubjectRow(controller.subjects[index]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Session.user?.role == 'admin'
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 10,
              child: FloatingActionButton(
                backgroundColor: AppColors.CREMIZON,
                onPressed: () {
                  Get.to(() => const AddSubject());
                },
                child: const Text(
                  "إضافة مادة",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.LIGHT_TEXT),
                ),
              ),
            )
          : null,
    );
  }
}

class SubjectRow extends StatefulWidget {
  const SubjectRow(this._rowSubject, {super.key});

  final SubjectDto _rowSubject;

  @override
  State<SubjectRow> createState() => _SubjectRowState();
}

class _SubjectRowState extends State<SubjectRow> {
  final SubjectController controller = Get.find<SubjectController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.CREMIZON,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT_TEXT,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.CREMIZON,
          child: Icon(
            Icons.menu_book,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        title: Text(
          '${widget._rowSubject.name}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'المدرس : كل المعلمات',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.CREMIZON,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            // Handle menu item selection
            print('Selected option: $value');
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'delete',
                child: const Text('حذف'),
                onTap: () async {
                  await controller.getUnitsSubject(widget._rowSubject.id);
                  if (controller.units.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: ((context) {
                        return CustomAlertDialog(
                          headText: 'خطأ',
                          headColor: AppColors.DANGER,
                          bodyText:
                              'يحتوي هذا الكتاب على مجموعة دروس، يرجى حذفهن قبل حذف هذا الدرس',
                          ButtonText: 'مفهوم',
                          btnColor: AppColors.SECONDARY_COLOR,
                          onPressed: () {
                            Get.back();
                          },
                        );
                      }),
                    );
                  } else {
                    controller.deleteSubject(widget._rowSubject.id);
                  }
                },
              ),
            ];
          },
        ),
        onTap: () => Get.to(
          () => SubjectInfo(
            null,
            subjectDto: widget._rowSubject,
          ),
        ),
      ),
    );
  }
}

