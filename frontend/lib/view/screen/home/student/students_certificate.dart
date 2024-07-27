import 'package:flutter/material.dart';
import 'package:frontend/controller/student_ctrl/student_certificate.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/students.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class StudentCertificate extends StatefulWidget {
  StudentDto studentDto;
  StudentCertificate({required this.studentDto, super.key}) {
    controller.student = studentDto;
    controller.fetchFinalMarks();
  }
  StudentCertificateController controller =
      Get.find<StudentCertificateController>();

  @override
  State<StudentCertificate> createState() => _StudentCertificateState();
}

class _StudentCertificateState extends State<StudentCertificate> {
  bool isSubjectSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<StudentCertificateController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.SECONDARY_COLOR,
            appBar: AppBar(
              backgroundColor: AppColors.CREMIZON,
              foregroundColor: AppColors.SECONDARY_COLOR,
              title: const Text(
                'أداء الطالب',
                style: TextStyle(color: AppColors.LIGHT_TEXT),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    const Text(
                      'تقييم النهائي للمواد',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Divider(
                        thickness: 5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: DataTable(
                        headingRowHeight: 50,
                        columnSpacing: 20,
                        dataRowHeight: 60,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.SECONDARY_COLOR),
                        columns: const [
                          DataColumn(
                            label: Text(
                              'العلامات',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'المواد',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          controller.finalMarks.length,
                          (index) {
                            var subject = controller.finalMarks[index];
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    subject.grade!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    '${subject.subject?.name}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      controller.showProgress = true;
                                      controller
                                          .fetchUnitsMarks(subject.subject?.id);
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'تقييم الدروس',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (controller.unitsMarks.isEmpty)
                          const Text(
                              'يرجى الضغط على اسم المادة لعرض تقييمات الدروس'),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: Divider(
                            thickness: 5,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (controller.showProgress)
                          const Padding(padding: EdgeInsets.only(top: 10)),
                        if (controller.showProgress)
                          const CustomLoadingAnimation(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: DataTable(
                            headingRowHeight: 50,
                            columnSpacing: 20,
                            dataRowHeight: 60,
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.SECONDARY_COLOR),
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'العلامات',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'الدرس',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              controller.unitsMarks.length,
                              (index) {
                                var unit = controller.unitsMarks[index];
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        unit.grade!,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '${unit.unit?.name}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
