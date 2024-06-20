import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/view/screen/class_manage/class_info.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ClassRow extends StatelessWidget {
  ClassRow(this._rowClass, {super.key});

  final ClassDto _rowClass;
  final ClassController controller = Get.find<ClassController>();
  final ClassSubjectsController classSubjectsController =
      Get.find<ClassSubjectsController>();

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => Get.to(
        () => ClassInfo(classDto: _rowClass),
      ),
      onLongPress: () {
        showDialog(
            context: context,
            builder: ((context) {
              return CustomAlertDialog(
                headText: 'تحذير',
                headColor: AppColors.DANGER,
                bodyText:
                    'هل أنت متأكد من عملية حذف هذا الصف ؟؟\n سيتم عمل تغييرات على المعلومات المرتبطة بهذا الصف',
                ButtonText: 'تأكيد',
                btnColor: AppColors.SECONDARY_COLOR,
                onPressed: () {
                  controller.deleteClass(_rowClass.id);
                },
              );
            }));
      },
      child: Card(
        shadowColor: AppColors.LIGHT_TEXT,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        color: AppColors.SECONDARY_COLOR,
        // Use a PopupMenuButton as the trailing widget
        // Note: You may need to adjust the position of the PopupMenuButton
        // depending on your layout
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: AppColors.LIGHT,
                radius: 30,
                child: Icon(
                  Icons.home,
                  color: AppColors.LIGHT_TEXT,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${_rowClass.className}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${_rowClass.classYear}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.LIGHT_TEXT,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
