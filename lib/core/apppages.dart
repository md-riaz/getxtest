import 'package:get/get.dart';

import '../features/auth/views/login_view.dart';
import '../features/dashboard/dashboard_view.dart';
import '../features/splash/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => const LoginView()),
    GetPage(name: '/dashboard', page: () => const DashboardView()),
  ];
}
