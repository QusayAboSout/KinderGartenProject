import 'package:frontend/core/services/session.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomDrawerController extends GetxController {
  var role = Session.user?.role; // Initialize with a default role
}