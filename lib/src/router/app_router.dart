import 'package:get/route_manager.dart';
import 'package:hue_moffice/src/presentations/auth/bindings/auth_bindings.dart';
import 'package:hue_moffice/src/presentations/auth/login_screen.dart';
import 'package:hue_moffice/src/presentations/home/bindings/home_bindings.dart';
import 'package:hue_moffice/src/presentations/home/home_screen.dart';
import 'package:hue_moffice/src/presentations/splash/bindings/splash_bindings.dart';
import 'package:hue_moffice/src/presentations/splash/splash_screen.dart';

class AppRouter {
  static const loginScreen = "/login";
  static const homeScreen = "/home";
  static const splashScreen = "/splash";
  static List<GetPage> pages = [
    GetPage(name: loginScreen, page: () => const LoginScreen(), bindings: [
      AuthBindings(),
    ]),
    GetPage(name: homeScreen, page: () => HomeScreen(), bindings: [
      HomeBindings(),
    ]),
    GetPage(name: splashScreen, page: () => const SplashScreen(), bindings: [
      SplashBindings(),
    ])
  ];
}
