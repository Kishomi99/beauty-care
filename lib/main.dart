import 'package:BeautyCare/localization/app_localization.dart';
import 'package:BeautyCare/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beauty Care',
      translations: AppLocalization(),
      locale: Get.deviceLocale, // Automatically use the device's locale
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.splashScreen,
      getPages: AppRoute.pages,
    );
  }
}
