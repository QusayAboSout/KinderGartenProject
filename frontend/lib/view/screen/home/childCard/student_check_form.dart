import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/view/screen/home/childCard/application_form_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCheckForm extends StatefulWidget {
  ChildCardDto childCard;
  StudentCheckForm({required this.childCard, super.key});

  @override
  State<StudentCheckForm> createState() => _StudentCheckFormState();
}

class _StudentCheckFormState extends State<StudentCheckForm> {
  final ChildCardController controller = Get.find<ChildCardController>();

  final StudentController stdController = Get.find<StudentController>();

  final _formKey = GlobalKey<FormBuilderState>();
  final _rejectFormKey = GlobalKey<FormBuilderState>();

  final myController = TextEditingController();
  double? sizedBoxHeight = 20;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildCardController>(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.CREMIZON,
        appBar: AppBar(
          title: const Text(
            'بطاقة طفل الروضة',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColors.LIGHT_TEXT),
          ),
          centerTitle: true,
          backgroundColor: AppColors.BACKGROUND_COLOR,
          foregroundColor: AppColors.CREMIZON,
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
                        color: AppColors.BACKGROUND_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.studentName,
                      label: 'اسم الطفل',
                      hint: 'الاسم...',
                      formName: 'studentName',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.fatherName,
                      label: 'اسم الأب',
                      hint: 'الاسم...',
                      formName: 'fatherName',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.grandFatherName,
                      label: 'اسم الجد',
                      hint: 'الاسم...',
                      formName: 'grandFatherName',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.familyName,
                      label: 'اسم العائلة',
                      hint: 'الاسم...',
                      formName: 'familyName',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.birthOfDate,
                      label:
                          'تاريخ الميلاد', ///////////////////////////////////////////
                      hint: 'الاسم...',
                      formName: 'birthOfDate',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.address,
                      label: 'مكان السكن',
                      hint: 'الاسم...',
                      formName: 'studentLocation',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.phoneNumber,
                      label: 'رقم هاتف البيت',
                      hint: 'الرقم...',
                      formName: 'phoneNumber',
                      textInputType: TextInputType.number,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      initalValue: widget.childCard.childLivesWith,
                      label: 'يعيش الطفل مع',
                      hint: 'مع...',
                      formName: 'childLivesWith',
                      textInputType: TextInputType.text,
                      enabled: false,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    // CustomTextField(
                    //   initalValue: childCard.parentsSituation,
                    //   label: 'الحالة الاجتماعية للوالدين',
                    //   hint: 'الحالة...',
                    //   formName: 'parentsSituation',
                    //   textInputType: TextInputType.text,
                    //   enabled: false,
                    // ),
                    SizedBox(height: sizedBoxHeight),
                    Session.user?.role == "admin"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                text: "قبول",
                                txtColor: AppColors.LIGHT_TEXT,
                                color: AppColors.ACCEPT,
                                buttonWidth: MediaQuery.of(context).size.width *
                                    4.5 /
                                    10,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return CustomAlertDialog(
                                          headText: 'إضافة طالب',
                                          headColor: AppColors.ACCEPT,
                                          bodyText:
                                              'هل انت متأكد من قبول هذا الطالب ؟',
                                          ButtonText: 'قبول',
                                          btnColor: AppColors.ACCEPT,
                                          onPressed: () async {
                                            if (IsValid()) {
                                              await stdController.addStudent(
                                                  widget.childCard,
                                                  _formKey.currentState!.value);
                                              widget.childCard.isCheck = true;
                                              widget.childCard.status = true;
                                              await controller.updateChildCard(
                                                  widget.childCard,
                                                  widget.childCard.toJson());
                                              await controller
                                                  .getChildCardsByUser();
                                              Get.back();
                                            }
                                            Get.back();
                                            Get.off(
                                                const ApplicationFormScreen());
                                          },
                                        );
                                      }));
                                },
                              ),
                              CustomButton(
                                buttonWidth: MediaQuery.of(context).size.width *
                                    4.5 /
                                    10,
                                text: "رفض",
                                txtColor: AppColors.LIGHT_TEXT,
                                color: AppColors.DANGER,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return CustomAlertDialog2(
                                          buttonText: 'رفض',
                                          bodyText: 'السبب...',
                                          headText: 'رفض طلب',
                                          widget: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              // if (headText != null) const SizedBox(height: 8),
                                              FormBuilder(
                                                key: _rejectFormKey,
                                                child: FormBuilderTextField(
                                                  controller: myController,
                                                  name: 'postInfo',
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText:
                                                              'سبب الرفض...',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            if (myController.text.isEmpty) {
                                            } else {
                                              widget.childCard.isCheck = true;
                                              widget.childCard.status = false;
                                              widget.childCard.rejectReason =
                                                  myController.text;
                                              controller.updateChildCard(
                                                  widget.childCard,
                                                  widget.childCard.toJson());
                                              controller.getChildCardsByUser();
                                              controller.update();
                                              Get.back();
                                              Get.back();
                                            }
                                          },
                                        );
                                      }));
                                },
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
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
