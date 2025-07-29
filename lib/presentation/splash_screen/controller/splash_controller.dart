import 'package:BeautyCare/core/utils/pref_utils.dart';
import 'package:BeautyCare/route/app_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    await PrefUtils().init();

    String token = PrefUtils().getToken();
    print('token is $token');
    Get.offAllNamed(AppRoute.loginScreen);

    /* if (token.isNotEmpty) {
      //  Get.offAllNamed(AppRoute.mainScreen);
    } else {
      Get.offAllNamed(AppRoute.loginScreen);
    }*/
  }
}
