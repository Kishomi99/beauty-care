import 'package:beauty_care/presentation/create_account_screen/binding/creatt_account_binding.dart';
import 'package:beauty_care/presentation/create_account_screen/create_account_screen.dart';
import 'package:beauty_care/presentation/home_screen/binding/home_binding.dart';
import 'package:beauty_care/presentation/home_screen/home_screen.dart';
import 'package:beauty_care/presentation/login_screen/binding/login_binding.dart';
import 'package:beauty_care/presentation/login_screen/login_screen.dart';
import 'package:beauty_care/presentation/splash_screen/binding/splash_binding.dart';
import 'package:beauty_care/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String createAccountScreen = '/create_account';
  static const String homeScreen = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: createAccountScreen,
      page: () => CreateAccountScreen(),
      bindings: [
        CreateAccountBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
