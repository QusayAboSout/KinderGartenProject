import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/controller/notification_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/view/screen/home/childCard/student_check_form.dart';
import 'package:frontend/view/screen/home/childCard/student_check_form_with_reason.dart';
import 'package:frontend/view/tools/loading_animation.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final NotificationController _controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.SECONDARY_COLOR,
      child: FutureBuilder(
          future: _controller.getChildCardsStatusByUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomLoadingAnimation());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GetBuilder<NotificationController>(
                  init: _controller,
                  builder: (controller) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: controller.cards.isNotEmpty
                            ? Column(
                                children: [
                                  GetBuilder<NotificationController>(
                                    id: 'progress',
                                    builder: (controller) {
                                      return Column(
                                        children: [
                                          if (controller.showProgress)
                                            const CustomLoadingAnimation(),
                                        ],
                                      );
                                    },
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: controller.cards.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var item = controller.cards[index];
                                          return NotificationChildCardRow(item);
                                        }),
                                  ),
                                ],
                              )
                            : const Center(
                                child: Text(
                                  "لا توجد اشعارات حتى الان",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.LIGHT_TEXT),
                                ),
                              ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class NotificationChildCardRow extends StatelessWidget {
  NotificationChildCardRow(this._rowCardDto, {super.key});

  final ChildCardDto _rowCardDto;
  final ChildCardController controller = Get.find<ChildCardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      child: Container(
        color: _rowCardDto.status == false
            ? const Color.fromARGB(255, 172, 137, 140)
            : const Color.fromARGB(255, 89, 164, 129),
        child: ListTile(
          // tileColor:
          leading: const CircleAvatar(
            backgroundColor: AppColors.LIGHT_TEXT,
            child: Icon(
              Icons.person,
              color: AppColors.LIGHT_TEXT,
            ),
          ),
          title: Text('${_rowCardDto.studentName}'),
          subtitle: Text('رقم الطلب : ${_rowCardDto.id}'),
          onTap: () {
            Get.to(() => StudentCheckFormWithReason(childCard: _rowCardDto));
          },
          trailing: PopupMenuButton<String>(
            onSelected: (String value) {
              print('Selected option: $value');
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'delete',
                  child: const Text('حذف'),
                  onTap: () async {
                    _rowCardDto.status = null;
                    await controller.updateChildCard(
                        _rowCardDto, _rowCardDto.toJson());
                  },
                ),
              ];
            },
          ),
        ),
      ),
    );
  }
}
