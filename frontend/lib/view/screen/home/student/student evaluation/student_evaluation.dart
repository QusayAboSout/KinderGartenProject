import 'package:flutter/material.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/screen/home/student/student%20evaluation/final_marks.dart';
import 'package:frontend/view/screen/home/student/student%20evaluation/student_progress_evaluation.dart';
import 'package:get/get.dart';

class StudentMarks extends StatelessWidget {
  StudentMarks(this._classDto, this._subjectDto, this._rowStudent, {super.key});

  final StudentDto _rowStudent;
  final ClassDto _classDto;
  final SubjectDto _subjectDto;
  final StudentController studentController = Get.find<StudentController>();
  final ClassController classController = Get.find<ClassController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT_TEXT,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.SECONDARY_COLOR,
          child: Icon(
            Icons.person,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        title: Text(
          '${_rowStudent.studentName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: PopupMenuButton<String>(onSelected: (String value) {
          // Handle menu item selection
          print('Selected option: $value');
        }, itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'unitRating',
              child: const Text('تقييمات الدروس'),
              onTap: () {
                Get.to(
                    () => StudentUnitMark(_subjectDto, _classDto, _rowStudent));
              },
            ),
            PopupMenuItem<String>(
              value: 'subjectRating',
              child: const Text('تقييم المادة'),
              onTap: () {
                if (Session.user?.role == 'admin') {
                  Get.to(() => finalMarksClass());
                } else {
                  Get.to(() => StudentFinalMarks(_classDto, _rowStudent));
                }
              },
            ),
          ];
        }),
        onTap: () {
          ///
        },
      ),
    );
  }
}
