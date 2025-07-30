import 'package:beauty_care/presentation/buttom_navigation/controller/buttom_navigation_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
  }
}
