import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  final TextEditingController _dataController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final ClassController controller = Get.find<ClassController>();
  double? sizedBoxHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          title: const Text(
            'إضافة صف',
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
                      label: 'اسم الصف',
                      hint: 'الاسم...',
                      formName: 'className',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    const CustomTextField(
                      label: 'تاريخ إنشاء الصف',
                      hint: 'التاريخ...',
                      formName: 'classYear',
                      textInputType: TextInputType.number,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomButton(
                        text: "إضافة",
                        onPressed: () {
                          if (IsValid()) {
                            controller.addClass(_formKey.currentState!.value);
                            print(" Every thing looks great");
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                headText: "إضافة صف",
                                bodyText:
                                    "تمت إضافة الصف ${_formKey.currentState!.value["className"]}",
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
