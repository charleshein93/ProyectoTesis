import 'package:flutter/widgets.dart';
import 'package:mapa01/ui/pages/home/home_page.dart';
import 'package:mapa01/ui/pages/home/login_page.dart';
import 'package:mapa01/ui/pages/request_permission/request_permission_page.dart';
import 'package:mapa01/ui/pages/routes/routes.dart';
import 'package:mapa01/ui/pages/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.LOGIN: (_) => const LoginPage(),
  };
}
