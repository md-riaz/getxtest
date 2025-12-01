import 'package:get/get.dart';
import 'package:getxtest/core/bindings/session_manager_bindings.dart';
import 'package:getxtest/features/auth/views/login_view.dart';
import 'package:getxtest/features/navigation/views/main_navigation_view.dart';

class AuthService extends GetxService {
  final _isAuthenticated = false.obs;
  bool get isAuthenticated => _isAuthenticated.value;

  void clearState() {
    _isAuthenticated.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    print("🔐 AuthService: onInit() - Service initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("🔐 AuthService: onReady() - Service ready for use");
  }

  @override
  void onClose() {
    print("🔐 AuthService: onClose() - Service being disposed");
    super.onClose();
  }

  void login() {
    print("🔐 AuthService: login() - Starting login process");
    _isAuthenticated.value = true;

    // Initialize session bindings with tags on login
    print("🔐 AuthService: login() - Initializing session bindings");
    SessionManagerBindings().dependencies();

    print("🔐 AuthService: login() - Navigating to main navigation");
    Get.offAll(() => const MainNavigationView());
    print("🔐 AuthService: login() - Login process completed");
  }

  void logout() {
    print("🔐 AuthService: logout() - Logout initiated");

    // Clear authentication state first
    _isAuthenticated.value = false;
    print("🔐 AuthService: logout() - Authentication state cleared");

    // Terminate session dependencies before navigation
    print("🔐 AuthService: logout() - Terminating session dependencies");
    SessionManagerBindings.terminateSession();

    // Navigate to login after cleanup
    print("🔐 AuthService: logout() - Navigating to login view");
    Get.offAll(() => const LoginView());
    print("🔐 AuthService: logout() - Logout process completed");
  }
}
