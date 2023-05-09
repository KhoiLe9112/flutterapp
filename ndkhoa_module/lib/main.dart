import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ndkhoa_module/src/core/utils/init_bindings.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Hue Festival',
      initialBinding: InitialBindings(),
      initialRoute: AppRouter.homeScreen,
      getPages: AppRouter.pages,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!);
      },
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 1,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.blue))),
    );
  }
}
