import 'package:frontend/core/services/registration_fees_service.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/model/registration_fees.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RegistrationFeesController extends GetxController {
  bool loading = false;
  var RegistrationFees = RegistrationFeesDto();
  final RegistrationFeesPaginationResult _RegistrationFeesPaginationResult =
      RegistrationFeesPaginationResult(data: []);
  List<RegistrationFeesDto> subjects = [];
  PagingController<int, RegistrationFeesDto> pagingController =
      PagingController(firstPageKey: 0);
  var service = locator<RegistrationFeesServices>();
  var error = "";

  @override
  void onInit() async {
    super.onInit();
  }

  Future getRegistrationFeess() async {
    try {
      loading = true;
      _RegistrationFeesPaginationResult.data = await service.getRegistrationFeess();
      if (_RegistrationFeesPaginationResult.data != null) {
        subjects = _RegistrationFeesPaginationResult.data!;
      }
      loading = false;
      update();
    } on CustomExcetion catch (e) {
      loading = false;
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
  }

  Future addRegistrationFees(Map<String, dynamic> value) async {
    try {
      var RegistrationFees = RegistrationFeesDto.fromJson(value);
      RegistrationFees = await service.addRegistrationFees(RegistrationFees);
    } on CustomExcetion catch (e) {
      error = e.apiExcetion.messages!.map((e) => e.messageCode).join(" ,");
      update();
    }
    getRegistrationFeess();
  }

  deleteRegistrationFees(num? id) async {
    if (id == null) return;
    var result = await service.deleteRegistrationFees(id);
    pagingController.refresh();
    update();
    getRegistrationFeess();
  }

  updateRegistrationFees(RegistrationFeesDto old, Map<String, dynamic> value) async {
    var std = RegistrationFeesDto.fromJson(value);
    std.id = old.id;
    std = await service.updateRegistrationFees(std);
    refresh();
    update();
    getRegistrationFeess();
  }
}
