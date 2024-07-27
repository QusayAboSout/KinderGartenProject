import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/class/custom_button.dart';
import 'package:frontend/core/class/custom_text_field.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class childCardForm extends StatefulWidget {
  const childCardForm({super.key});

  @override
  State<childCardForm> createState() => _childCardFormState();
}

class _childCardFormState extends State<childCardForm> {
  final TextEditingController _dataController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final ChildCardController _childCardController =
      Get.find<ChildCardController>();
  double? sizedBoxHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildCardController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          title: const Text(
            'بطاقة طفل الروضة',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColors.LIGHT_TEXT),
          ),
          centerTitle: true,
          backgroundColor: AppColors.CREMIZON,
          foregroundColor: AppColors.SECONDARY_COLOR,
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
                    CustomTextField(
                      label: 'اسم الطالب',
                      hint: 'الاسم...',
                      formName: 'studentName',
                      textInputType: TextInputType.text,
                      isQ: true,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'اسم الأب',
                      hint: 'الاسم...',
                      formName: 'fatherName',
                      textInputType: TextInputType.text,
                      isQ: true,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'اسم الجد',
                      hint: 'الاسم...',
                      formName: 'grandFatherName',
                      textInputType: TextInputType.text,
                      isQ: true,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'اسم العائلة',
                      hint: 'الاسم...',
                      formName: 'familyName',
                      textInputType: TextInputType.text,
                      isQ: true,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 9 / 10,
                      child: FormBuilderTextField(
                        controller: _dataController,
                        name: 'birthOfDate',
                        decoration: const InputDecoration(
                          label: Text("تاريخ ميلاد الطفل"),
                          labelStyle: TextStyle(
                              color: AppColors.LIGHT_TEXT,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: AppColors.LIGHT_TEXT,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.SECONDARY_COLOR, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.3))),
                          fillColor: AppColors.BACKGROUND_COLOR,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.SECONDARY_COLOR, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.3)),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        validator: _validateDate,
                      ),
                    ),
                    SizedBox(height: sizedBoxHeight),
                    const CustomTextField(
                      label: 'مكان السكن',
                      hint: 'الاسم...',
                      formName: 'address',
                      textInputType: TextInputType.text,
                      isQ: true,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'رقم هاتف البيت',
                      hint: 'الرقم...',
                      formName: 'phoneNumber',
                      textInputType: TextInputType.number,
                      isQ: true,
                      inputFormat: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      maxLength: 10,
                    ),
                    SizedBox(height: sizedBoxHeight),
                    CustomTextField(
                      label: 'يعيش الطفل مع',
                      hint: 'مع...',
                      formName: 'childLivesWith',
                      textInputType: TextInputType.text,
                      isQ: true,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                      ],
                    ),
                    SizedBox(height: sizedBoxHeight),
                    // CustomTextField(
                    //   label: 'الحالة الاجتماعية للوالدين',
                    //   hint: 'الحالة...',
                    //   formName: 'parentsSituation',
                    //   textInputType: TextInputType.text,
                    //   isQ: true,
                    //   inputFormat: <TextInputFormatter>[
                    //     FilteringTextInputFormatter.allow(
                    //         RegExp(r'[a-zA-Z\s\u0600-\u06FF]')),
                    //   ],
                    // ),
                    SizedBox(height: sizedBoxHeight),
                    CustomButton(
                        text: "تسليم",
                        onPressed: () {
                          if (IsValid()) {
                            // controller.checkDoublicateChildCard(_formKey.currentState!.value);
                            controller
                                .addChildCard(_formKey.currentState!.value);

                            Get.offAll(() => const Home());
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                headText: "تقديم طلب التحاق",
                                bodyText: "تم إرسال طلب الالتحاق بنجاح",
                                ButtonText: "مفهوم",
                                onPressed: () {
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dataController.text = picked.toString().split(" ")[0];
      });
    }
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    DateTime selectedDate = DateTime.parse(value);
    DateTime now = DateTime.now();
    int age = now.year - selectedDate.year;
    if (now.month < selectedDate.month ||
        (now.month == selectedDate.month && now.day < selectedDate.day)) {
      age--;
    }

    if (age < 4 || age > 7) {
      return 'عمر الطالب يجب ان يكون اقل من 7 سنة أو اكبر من 3 سنين';
    }
    return null;
  }
}
