import 'package:beauty_care/core/utils/pref_utils.dart';
import 'package:beauty_care/route/app_route.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  void logout() {
    PrefUtils.logout();
    Get.offAllNamed(AppRoute.loginScreen);
  }
}
  // Define your controller logic here
