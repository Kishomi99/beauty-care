import 'package:beauty_care/presentation/buttom_navigation/binding/home_binding.dart';
import 'package:beauty_care/presentation/buttom_navigation/buttom_navigation.dart';
import 'package:beauty_care/presentation/create_account_screen/binding/creatt_account_binding.dart';
import 'package:beauty_care/presentation/create_account_screen/create_account_screen.dart';
import 'package:beauty_care/presentation/home_screen/binding/home_binding.dart';
import 'package:beauty_care/presentation/home_screen/home_screen.dart';
import 'package:beauty_care/presentation/login_screen/binding/login_binding.dart';
import 'package:beauty_care/presentation/login_screen/login_screen.dart';
import 'package:beauty_care/presentation/profile_screen/profile_screen.dart';
import 'package:beauty_care/presentation/splash_screen/binding/splash_binding.dart';
import 'package:beauty_care/presentation/splash_screen/splash_screen.dart';
import 'package:beauty_care/presentation/store_view_screen/binding/store_view_binding.dart';
import 'package:beauty_care/presentation/store_view_screen/store_view_screen.dart';
import 'package:beauty_care/presentation/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String createAccountScreen = '/create_account';
  static const String homeScreen = '/home';
  static const String bottomNavigationMenu = '/bottom_navigation';
  static const String profileScreen = '/profile';
  static const String wishlistScreen = '/wishlist';
  static const String storeViewScreen = '/store_view';

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
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: bottomNavigationMenu,
      page: () => const NavigationMenu(),
      bindings: [
        BottomNavigationBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: wishlistScreen,
      page: () => WishListScreen(),
    ),
    GetPage(
      name: storeViewScreen,
      page: () => const StoreViewScreen(),
      bindings: [
        StoreViewBinding(),
      ],
    )
  ];
}
