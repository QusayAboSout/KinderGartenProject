import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/model/subjects.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUnits extends StatelessWidget {
  final SubjectDto _subjectDto;
  AddUnits(this._subjectDto, {super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final SubjectController subjectController = Get.find<SubjectController>();
  final UnitController unitController = Get.find<UnitController>();

  double? sizedBoxHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: unitController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'إضافة درس',
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
                      label: 'اسم الدرس',
                      hint: 'الاسم...',
                      formName: 'name',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    SizedBox(height: sizedBoxHeight),
                    CustomButton(
                        text: "إضافة",
                        onPressed: () {
                          if (IsValid()) {
                            controller.addUnit(_formKey.currentState!.value,_subjectDto.id);
                            print(" Every thing looks great");
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                headText: "إضافة درس",
                                bodyText:
                                    "تمت إضافة درس  ${_formKey.currentState!.value["name"]}",
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
