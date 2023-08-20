import 'package:get/get.dart';
import 'package:irhib/ui/guide_app/add_tripe.dart';
import 'package:irhib/ui/home/home_screen.dart';

import '../ui/auth/signin.dart';
import '../ui/auth/signup.dart';
import '../ui/splash_screen.dart';

class AppRoutes {
  static final listRoutes = [
    GetPage(name: Routes.spalsh, page: () => SplashScreen()),
    GetPage(name: Routes.signIn, page: () => SignIn()),
    GetPage(name: Routes.signUp, page: () => ServiceProviderSignUp()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.home, page: () => AddTripe()),
  ];
}

class Routes {
  static const String spalsh = '/splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String addTripe = '/addTripe';
}
