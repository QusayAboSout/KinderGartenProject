import 'package:flutter/material.dart';
import 'package:frontend/core/services/child_card_services.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChildCardController extends GetxController {
  ChildCardController();
  bool loading = false;
  bool showProgress = false;
  var childCardDto = ChildCardDto();
  var error = "";
  var service = locator<ChildCardServices>();
  final ChildCardPaginationResult _childCardPaginationResult =
      ChildCardPaginationResult(data: []);
  List<ChildCardDto> cards = [];

  final PagingController<int, ChildCardDto> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    super.onInit();
    await getChildCardsByUser();
    //await getChildsCard();
  }

  Future addChildCard(Map<String, dynamic> value) async {
    try {
      var child = ChildCardDto.fromJson(value);
      child.birthOfDate = formatDate(child.birthOfDate!);
      child.userID = Session.user?.id;
      child.isCheck = false;
      child = await service.addChildCard(child);
      pagingController.refresh();
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getChildCardsByUser();
  }

  String formatDate(String date) {
    if (date.contains('-')) {
      List<String> parts = date.split('-');
      String year = parts[0];
      String month = parts[1];
      String day = parts[2];

      if (month.length == 1) {
        month = '0$month';
      }
      if (day.length == 1) {
        day = '0$day';
      }
      return '$year-$month-$day';
    } else {
      return 'Date does not contain expected delimiter: $date';
    }
  }

  Future getChildsCard() async {
    try {
      showProgress = true;
      update(['progress']);
      _childCardPaginationResult.data = await service.getChildCards();
      if (_childCardPaginationResult.data != null) {
        cards = _childCardPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    showProgress = false;
    update(['progress']);
  }

  Future getChildCardsByUser() async {
    try {
      showProgress = true;
      update(['progress']);

      _childCardPaginationResult.data = await service.getChildCardsByUser();
      if (_childCardPaginationResult.data != null) {
        cards = _childCardPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    showProgress = false;
    update(['progress']);
  }

  Future getChildCardsStatusByUser() async {
    try {
      showProgress = true;
      update(['progress']);

      _childCardPaginationResult.data = await service.getChildCardsByUser();
      if (_childCardPaginationResult.data != null) {
        cards = _childCardPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    showProgress = false;
    update(['progress']);
  }

  updateChildCard(ChildCardDto old, Map<String, dynamic> value) async {
    var child = ChildCardDto.fromJson(value);
    child.id = old.id;
    child = await service.updateChildCard(child);
    refresh();
    update();
  }

  // updateCheckCard(ChildCardDto childCard) {
  //   final Map<String, dynamic> value = <String, dynamic>{};
  //   childCard.isCheck = true;
  //   value.addAll(childCard.toJson());
  //   updateChildCard(childCard, value);
  // }

  deleteChildCard(num? id) async {
    if (id == null) return;
    var result = await service.deleteChildCard(id);
    pagingController.refresh();
    update();
    getChildCardsByUser();
  }
}
