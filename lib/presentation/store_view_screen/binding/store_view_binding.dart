import 'package:beauty_care/presentation/store_view_screen/controller/store_view_controller.dart';
import 'package:get/get.dart';

class StoreViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreViewController());
  }
}
