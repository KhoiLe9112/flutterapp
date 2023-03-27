import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hue_moffice/src/core/utils/init_bindings.dart';
import 'package:hue_moffice/src/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'Hue Festival',
      initialBinding: InitialBindings(),
      //opaqueRoute: false,
      //home: OnBoardingScreeen()

      initialRoute: AppRouter.splashScreen,
      getPages: AppRouter.pages,
      // builder: EasyLoading.init(),
    );
  }
}
