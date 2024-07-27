import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/controller/general_evaluation_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/general_evaluation.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class finalMarksClass extends StatelessWidget {
  finalMarksClass({super.key});

  final ClassController controller = Get.find<ClassController>();

  //final ClassController controller = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.SECONDARY_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
          title: const Text(
            'الصفوف',
            style: TextStyle(color: AppColors.LIGHT_TEXT),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            if (controller.loading)
              const Padding(padding: EdgeInsets.only(top: 10)),
            if (controller.loading) const CustomLoadingAnimation(),
            Expanded(
              child: ListView.builder(
                itemCount: controller.clacess.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    FinalMarksClassRow(controller.clacess[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalMarksClassRow extends StatelessWidget {
  FinalMarksClassRow(this._rowClass, {super.key});

  final ClassDto _rowClass;
  final ClassController controller = Get.find<ClassController>();
  final ClassSubjectsController classSubjectsController =
      Get.find<ClassSubjectsController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.LIGHT_TEXT,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: AppColors.LIGHT_TEXT,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          child: Icon(
            Icons.home,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        title: Text(
          '${_rowClass.className}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${_rowClass.classYear}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.LIGHT_TEXT,
          ),
        ),
        onTap: () => Get.to(
          () => FinalMarksStudents(
            classDto: _rowClass,
          ),
        ),
      ),
    );
  }
}

class FinalMarksStudents extends StatelessWidget {
  ClassDto classDto;
  FinalMarksStudents({required this.classDto, super.key}) {
    classSubjectsController = Get.find<ClassSubjectsController>();
    classSubjectsController.claas = classDto;
    classSubjectsController.getClassSubjectss();
    if (classDto.teacherID != null) {
      classController.getClassTeacher(classDto);
    }
    classController.classID = classDto.id;
    classController.getStudentOfTheClass(classDto.id!);
  }

  final ClassController classController = Get.find<ClassController>();
  late ClassSubjectsController classSubjectsController;

  @override
  int numberOfStudent = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: classController,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/tom.png'), // Replace with actual user image
                ),
                const SizedBox(height: 10),
                Title(
                  color: AppColors.BACKGROUND_COLOR,
                  child: Text(
                    " تقييم العلامات النهائية لطلاب ${classDto.className}",
                    style: const TextStyle(
                        fontSize: 22.3,
                        color: AppColors.LIGHT_TEXT,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                // const Text(
                //   "المعلمة المسؤولة : رقية",
                //   style: TextStyle(fontSize: 17),
                // ),
                // const Text(
                //   "Number of student : 8",
                //   style: TextStyle(fontSize: 17),
                // ),
                const Divider(
                  thickness: 3,
                  color: AppColors.LIGHT_TEXT,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 1,
                    initialIndex: 0,
                    child: Scaffold(
                      backgroundColor: AppColors.BACKGROUND_COLOR,
                      appBar: AppBar(
                        toolbarHeight: 0,
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColors.BACKGROUND_COLOR,
                        bottom: const TabBar(
                          indicatorColor: AppColors.LIGHT_TEXT,
                          labelColor: AppColors.LIGHT_TEXT,
                          tabs: [
                            Tab(
                                child: Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    "طلاب الصف")),
                          ],
                        ),
                      ),
                      body: Scaffold(
                          backgroundColor: AppColors.SECONDARY_COLOR,
                          body: Column(
                            children: [
                              if (controller.loading)
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                              if (controller.loading)
                                const CustomLoadingAnimation(),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: classController.students!.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Card(
                                          shadowColor: AppColors.LIGHT_TEXT,
                                          elevation: 3,
                                          margin: const EdgeInsets.all(8),
                                          color: AppColors.LIGHT_TEXT,
                                          child: ListTile(
                                            leading: const CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  AppColors.SECONDARY_COLOR,
                                              child: Icon(
                                                Icons.person,
                                                color: AppColors.LIGHT_TEXT,
                                              ),
                                            ),
                                            title: Text(
                                              '${classController.students![index].studentName}',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            trailing: const Icon(
                                              Icons.quora_rounded,
                                              color: AppColors.LIGHT_TEXT,
                                            ),
                                            onTap: () {
                                              Get.to(() => StudentFinalMarks(
                                                  classDto,
                                                  classController
                                                      .students![index]));
                                            },
                                          ),
                                        )),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentFinalMarks extends StatefulWidget {
  final ClassDto _classDto;
  final StudentDto _studentDto;

  StudentFinalMarks(this._classDto, this._studentDto, {super.key}) {
    generalEvaluationController.getStudentFinalMarks(
        _classDto.id.toString(), _studentDto.id.toString());
  }

  final GeneralEvaluationController generalEvaluationController =
      Get.find<GeneralEvaluationController>();

  @override
  State<StudentFinalMarks> createState() => _StudentFinalMarksState();
}

class _StudentFinalMarksState extends State<StudentFinalMarks> {
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
                    headColor: AppColors.SECONDARY_COLOR,
                    btnColor: AppColors.LIGHT_TEXT,
                  );
                });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.SECONDARY_COLOR,
          ),
        ),
        backgroundColor: AppColors.CREMIZON,
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
                "التقييمات النهائية لمواد صف ${widget._classDto.className}",
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
              color: Colors.grey,
              thickness: 1,
            ),
            GetBuilder<GeneralEvaluationController>(
              builder: (controller) => Expanded(
                child: Column(
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
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Card(
                                  shadowColor: AppColors.LIGHT_TEXT,
                                  elevation: 3,
                                  margin: const EdgeInsets.all(8),
                                  color: AppColors.LIGHT_TEXT,
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.LIGHT_TEXT,
                                      child: Icon(Icons.menu_book_sharp),
                                    ),
                                    title: Text(
                                      '${item.subject?.name}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GetBuilder<GeneralEvaluationController>(
                                  builder: (generalController) {
                                    if (index >=
                                            generalController.marks.length ||
                                        generalController.marks.isEmpty) {
                                      return FormBuilderDropdown(
                                        enabled: Session.user?.role == 'teacher'
                                            ? true
                                            : false,
                                        borderRadius: BorderRadius.circular(20),
                                        initialValue:
                                            ratingOptions[0].value.toString(),
                                        items: ratingOptions,
                                        name: 'rating',
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              width: 3,
                                            )),
                                            labelText: 'بدون تقييم',
                                            hintText: 'بدون تقييم'),
                                        validator:
                                            FormBuilderValidators.required(
                                                errorText: 'يجب اختيار تقييم'),
                                        onChanged: (value) {
                                          item.grade = value.toString();
                                        },
                                      );
                                    } else {
                                      return FormBuilderDropdown(
                                        borderRadius: BorderRadius.circular(20),
                                        initialValue: generalController
                                                        .marks[index].grade !=
                                                    null &&
                                                ratingOptions
                                                    .map((item) => item.value)
                                                    .contains(generalController
                                                        .marks[index].grade)
                                            ? generalController
                                                .marks[index].grade
                                            : 'بدون تقييم',
                                        items: ratingOptions,
                                        name: 'rating',
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color: AppColors
                                                        .SECONDARY_COLOR)),
                                            labelText: 'تقييم',
                                            hintText: 'بدون تقييم'),
                                        validator:
                                            FormBuilderValidators.required(
                                                errorText: 'يجب اختيار تقييم'),
                                        onChanged: (value) {
                                          generalController.marks[index].grade =
                                              value;
                                        },
                                      );
                                    }
                                  },
                                ),
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
                return GetBuilder<GeneralEvaluationController>(
                  builder: (controller) {
                    return CustomAlertDialog(
                      ButtonText: 'حفظ',
                      bodyText: 'هل ترغب بتأكدي حفظ التغييرات التي فمت بها ؟',
                      headText: 'حفظ التغييرات',
                      onPressed: () {
                        controller.updateStudentFinalMarks(controller.marks);
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
                color: AppColors.LIGHT_TEXT),
          ),
        ),
      ),
    );
  }
}
