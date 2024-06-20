import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/model/class.dart';
import 'package:frontend/model/subjects.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final TextEditingController _dataController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final SubjectController subjectController = Get.find<SubjectController>();
  final ClassController classController = Get.find<ClassController>();
  // final ClassController classController = Get.find<ClassController>();
  double? sizedBoxHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: subjectController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'إضافة مادة',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.LIGHT_TEXT),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.BACKGROUND_COLOR,
              ),
            ),
          ],
          backgroundColor: AppColors.SECONDARY_COLOR,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "روضة نور الإيمان الخاصة",
                      style: GoogleFonts.marhey(
                          textStyle: const TextStyle(
                        color: AppColors.LIGHT_TEXT,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                    ),
                    SizedBox(height: sizedBoxHeight),
                    const CustomTextField(
                      label: 'اسم المادة',
                      hint: 'الاسم...',
                      formName: 'name',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomButton(
                        text: "إضافة",
                        onPressed: () {
                          if (IsValid()) {
                            controller.addSubject(_formKey.currentState!.value);
                            print(" Every thing looks great");
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                headColor: AppColors.SECONDARY_COLOR,
                                headText: "إضافة كتاب",
                                bodyText:
                                    "تمت إضافة كتاب  ${_formKey.currentState!.value["name"]}",
                                ButtonText: "موافق",
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                              ),
                            );
                          }
                        }),
                    SizedBox(height: sizedBoxHeight),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool IsValid() => _formKey.currentState!.saveAndValidate();
}
