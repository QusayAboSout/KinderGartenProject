import 'package:flutter/material.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/view/screen/home/childCard/student_check_form.dart';
import 'package:get/get.dart';

class ChildCardRow extends StatelessWidget {
  ChildCardRow(this._rowCardDto, {super.key});

  final ChildCardDto _rowCardDto;
  final ChildCardController controller = Get.find<ChildCardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      child: ListTile(
        tileColor: _rowCardDto.userID == 1
            ?
            AppColors.ACCEPT
            : AppColors.LIGHT_TEXT,
        leading: const CircleAvatar(
          backgroundColor: AppColors.LIGHT_TEXT,
          child: Icon(
            Icons.person,
            color: AppColors.BACKGROUND_COLOR,
          ),
        ),
        title: Text('${_rowCardDto.studentName}'),
        subtitle: Text('رقم الطلب : ${_rowCardDto.id}',style: const TextStyle(color: AppColors.CREMIZON),),
        trailing: (Text(
          '${DateTime.now().year}',
          style: const TextStyle(
            color: AppColors.CREMIZON,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        onTap: () {
          Get.to(() => StudentCheckForm(childCard: _rowCardDto));
        },
      ),
    );
  }
}
