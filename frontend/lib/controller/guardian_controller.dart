import 'package:frontend/core/services/gurdian_services.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/gurdian.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GuardianController extends GetxController {
  bool loading = false;
  var Guardian = GuardianDto();
  final GuardianPaginationResult _GuardianPaginationResult =
      GuardianPaginationResult(data: []);
  List<GuardianDto> subjects = [];
  PagingController<int, GuardianDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<GuardianServices>();
  var error = "";

  @override
  void onInit() async {
    super.onInit();
    await getGuardians();
  }

  Future getGuardians() async {
    try {
      loading = true;
      _GuardianPaginationResult.data = await service.getGuardians();
      if (_GuardianPaginationResult.data != null) {
        subjects = _GuardianPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addGuardian(Map<String, dynamic> value) async {
    try {
      var Guardian = GuardianDto.fromJson(value);
      Guardian = await service.addGuardian(Guardian);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getGuardians();
  }

  deleteGuardian(num? id) async {
    if (id == null) return;
    var result = await service.deleteGuardian(id);
    pagingController.refresh();
    update();
    getGuardians();
  }

  updateGuardian(GuardianDto old, Map<String, dynamic> value) async {
    var std = GuardianDto.fromJson(value);
    std.id = old.id;
    std = await service.updateGuardian(std);
    refresh();
    update();
    getGuardians();
  }
}
