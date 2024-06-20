import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/controller/progress_evaluation_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/progress_evaluation.dart';
import 'package:frontend/model/progress_evaluation_from_query.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StudentUnitMark extends StatefulWidget {
  final ClassDto _classDto;
  final SubjectDto _subjectDto;
  final StudentDto _studentDto;

  StudentUnitMark(this._subjectDto, this._classDto, this._studentDto,
      {super.key}) {
    progressEvaluationController.getUnitsMarksForStudent(
        _studentDto.id.toString(), _subjectDto.id.toString());
  }

  final ProgressEvaluationController progressEvaluationController =
      Get.find<ProgressEvaluationController>();

  @override
  State<StudentUnitMark> createState() => _StudentUnitMarkState();
}

class _StudentUnitMarkState extends State<StudentUnitMark> {
  // String _selectedOption = 'بدون تقييم'; // Default option
  final List<String> _selectedOptions = [];
  List<DropdownMenuItem<String>> ratingOptions = [
    const DropdownMenuItem(value: 'بدون تقييم', child: Text('بدون تقييم')),
    const DropdownMenuItem(value: 'ممتاز', child: Text('ممتاز')),
    const DropdownMenuItem(value: 'جيد جدا', child: Text('جيد جدا')),
    const DropdownMenuItem(value: 'جيد', child: Text('جيد')),
    const DropdownMenuItem(value: 'مقبول', child: Text('مقبول')),
  ];
  Map<num?, String?> newRating = <num?, String?>{};
  Map<num?, String?> unitsMap = <num?, String?>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    headText: 'تحذير !!',
                    bodyText:
                        'سيتم فقدان جميع التغييرات التي اجريتها على هذه الصفحة',
                    ButtonText: 'رجوع',
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                  );
                });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.BACKGROUND_COLOR,
          ),
        ),
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
                "${widget._subjectDto.name}",
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
              child: Container(
                color: AppColors.BLUE,
                child: GetBuilder<ProgressEvaluationController>(
                  builder: (controller) => Column(
                    children: [
                      if (controller.loading)
                        const Padding(padding: EdgeInsets.only(top: 10)),
                      if (controller.loading) const CustomLoadingAnimation(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.marks.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = controller.marks[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
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
                                        '${item.unit?.name}',
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
                                  child:
                                      GetBuilder<ProgressEvaluationController>(
                                          builder: (progressController) {
                                    return FormBuilderDropdown(
                                      enabled: Session.user?.role == 'teacher'
                                          ? true
                                          : false,
                                      borderRadius: BorderRadius.circular(20),
                                      initialValue: item.grade != null &&
                                              ratingOptions
                                                  .map((item) => item.value)
                                                  .contains(item.grade)
                                          ? item.grade
                                          : 'بدون تقييم',
                                      items: ratingOptions,
                                      name: 'rating',
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 3)),
                                          labelText: 'تقييم',
                                          hintText: 'بدون تقييم'),
                                      validator: FormBuilderValidators.required(
                                          errorText: 'يجب اختيار تقييم'),
                                      onChanged: (value) {
                                        item.grade = value;
                                      },
                                    );
                                  }),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
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
            showDialog(
              context: context,
              builder: ((context) {
                return GetBuilder<ProgressEvaluationController>(
                  builder: (controller) {
                    return CustomAlertDialog(
                      ButtonText: 'حفظ',
                      bodyText: 'هل ترغب بتأكدي حفظ التغييرات التي فمت بها ؟',
                      headText: 'حفظ التغييرات',
                      onPressed: () {
                        if (newRating.isNotEmpty) {
                          newRating.forEach((key, value) {
                            ProgressEvaluationDto obj = ProgressEvaluationDto();
                            obj.grade = value.toString();
                            obj.unitID = key;
                            obj.studentID = widget._studentDto.id;
                            obj.subjectID = widget._subjectDto.id;
                            controller.addProgressEvaluation(obj.toJson());
                          });
                        }
                        controller.updateUnitsMarksForStudent(controller.marks);
                        Get.back();
                        Get.back();
                      },
                    );
                  },
                );
              }),
            );
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
