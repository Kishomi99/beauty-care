import 'package:beauty_care/presentation/splash_screen/binding/splash_binding.dart';
import 'package:beauty_care/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashScreen = '/splash';
  static const String details = '/details';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
  ];
}
