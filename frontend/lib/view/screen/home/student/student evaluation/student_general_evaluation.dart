import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/controller/general_evaluation_controller.dart';
import 'package:frontend/controller/progress_evaluation_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/class_subjects.dart';
import 'package:frontend/model/general_evaluation.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class StudentGeneralEvaluation extends StatefulWidget {
  final ClassDto _classDto;
  final SubjectDto _subjectDto;
  final StudentDto _studentDto;
  StudentGeneralEvaluation(this._subjectDto, this._classDto, this._studentDto,
      {super.key}) {
    generalEvaluationController.getSubjectGrade(_studentDto.id.toString(),
        _classDto.id.toString(), _subjectDto.id.toString());
  }
  final GeneralEvaluationController generalEvaluationController =
      Get.find<GeneralEvaluationController>();
  @override
  State<StudentGeneralEvaluation> createState() =>
      _StudentGeneralEvaluationState();
}

class _StudentGeneralEvaluationState extends State<StudentGeneralEvaluation> {
  final List<String> _selectedOptions = [];
  List<DropdownMenuItem<String>> ratingOptions = [
    const DropdownMenuItem(value: 'بدون تقييم', child: Text('بدون تقييم')),
    const DropdownMenuItem(value: 'ممتاز', child: Text('ممتاز')),
    const DropdownMenuItem(value: 'جيد جدا', child: Text('جيد جدا')),
    const DropdownMenuItem(value: 'جيد', child: Text('جيد')),
    const DropdownMenuItem(value: 'مقبول', child: Text('مقبول')),
  ];
  GeneralEvaluationDto addSubjectEvaluation = GeneralEvaluationDto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.SECONDARY_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/pic1.jpg'), // Replace with actual user image
            ),
            const SizedBox(height: 10),
            Title(
              color: AppColors.BACKGROUND_COLOR,
              child: Text(
                "${widget._classDto.className}",
                style: const TextStyle(
                    fontSize: 22.3,
                    color: AppColors.LIGHT_TEXT,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "اسم الطالب : ${widget._studentDto.studentName}",
              style: const TextStyle(fontSize: 17),
            ),
            const Divider(
              thickness: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Card(
                            shadowColor: AppColors.LIGHT_TEXT,
                            elevation: 3,
                            margin: const EdgeInsets.all(8),
                            color: AppColors.SECONDARY_COLOR,
                            child: ListTile(
                              leading: const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.LIGHT_TEXT,
                              ),
                              title: Text(
                                '${widget._subjectDto.name}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: GetBuilder<GeneralEvaluationController>(
                            init: widget.generalEvaluationController,
                            builder: (controller) {
                              if (controller.loading) {
                                const Padding(
                                    padding: EdgeInsets.only(top: 10));
                                const CustomLoadingAnimation();
                              }
                              return FormBuilderDropdown(
                                borderRadius: BorderRadius.circular(20),
                                initialValue: controller
                                                .GeneralEvaluation.grade !=
                                            null &&
                                        ratingOptions
                                            .map(
                                                (item) => item.value.toString())
                                            .contains(controller
                                                .GeneralEvaluation.grade
                                                .toString())
                                    ? controller.GeneralEvaluation.grade
                                    : 'بدون تقييم',
                                items: ratingOptions,
                                name: 'rating',
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3)),
                                    labelText: 'التقييم',
                                    hintText: 'بدون تقييم'),
                                validator: FormBuilderValidators.required(
                                    errorText: 'يجب اختيار تقييم'),
                                onChanged: (value) {
                                  controller.GeneralEvaluation.grade =
                                      value.toString();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: FloatingActionButton(
          backgroundColor: AppColors.SECONDARY_COLOR,
          onPressed: () {
            addSubjectEvaluation.studentID = widget._studentDto.id;
            addSubjectEvaluation.subjectID = widget._subjectDto.id;
            addSubjectEvaluation.classID = widget._classDto.id;
            addSubjectEvaluation.grade ??= "بدون تقييم";
            widget.generalEvaluationController
                .addGeneralEvaluation(addSubjectEvaluation.toJson());
          },
          child: const Text(
            "حفظ التغييرات",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
