import 'package:frontend/core/services/child_card_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/childCardDto.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationController extends GetxController {
  NotificationController();
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

  Future getChildCardsStatusByUser() async {
    try {
      _childCardPaginationResult.data =
          await service.getChildCardsStatusByUser();
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
}
