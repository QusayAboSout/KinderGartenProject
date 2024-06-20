import 'package:flutter/material.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/model/unit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UnitRow extends StatelessWidget {
  UnitRow(this._rowUnit, this._subjectDto, {super.key});

  final UnitDto _rowUnit;
  final SubjectDto _subjectDto;
  final SubjectController subjectController = Get.find<SubjectController>();
  final UnitController unitController = Get.find<UnitController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppColors.SECONDARY_COLOR,
          radius: 30,
          child: Icon(
            Icons.menu_book,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        title: Text(
          '${_rowUnit.name}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'رقم الدرس : ${_rowUnit.id}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            print('Selected option: $value');
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'delete',
                child: const Text('حذف'),
                onTap: () {
                  unitController.deleteUnit(_rowUnit.id);
                  unitController.getUnitsSubject(_subjectDto.id);
                },
              ),
            ];
          },
        ),
        onTap: () {},
      ),
    );
  }
}
