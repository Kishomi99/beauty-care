import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreViewController extends GetxController {
  var model = BeautyStore(id: '');

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      model = arguments;
      print(model);
    }
  }

// Call function
  void launchCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);

    await launchUrl(callUri);
  }

// Message function
  void launchSMS(String phoneNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);

    await launchUrl(smsUri);
  }

  DateTime today = DateTime.now();
  String getDate() {
    String formattedDate = DateFormat('EE, MMMM d, yyyy').format(today);
    return formattedDate;
  }

  void openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(uri,
        mode: LaunchMode.externalApplication); // opens in browser/app
  }
}
