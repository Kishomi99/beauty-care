import 'package:BeautyCare/presentation/create_account_screen/binding/creatt_account_binding.dart';
import 'package:BeautyCare/presentation/create_account_screen/create_account_screen.dart';
import 'package:BeautyCare/presentation/login_screen/binding/login_binding.dart';
import 'package:BeautyCare/presentation/login_screen/login_screen.dart';
import 'package:BeautyCare/presentation/splash_screen/binding/splash_binding.dart';
import 'package:BeautyCare/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String createAccountScreen = '/create_account';

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
  ];
}
