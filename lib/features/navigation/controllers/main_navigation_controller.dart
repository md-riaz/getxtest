import 'package:get/get.dart';
import 'package:getxtest/features/auth/services/auth_service.dart';

class MainNavigationController extends GetxController {
  final _currentIndex = 0.obs;
  final AuthService _authService = Get.find<AuthService>();

  int get currentIndex => _currentIndex.value;

  void changeTab(int index) {
    _currentIndex.value = index;
  }

  void logout() {
    _authService.logout();
  }

  @override
  void onInit() {
    super.onInit();
    print("🧭 MainNavigationController: onInit() - Controller initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("🧭 MainNavigationController: onReady() - Controller ready for use");
  }

  @override
  void onClose() {
    print("🧭 MainNavigationController: onClose() - Controller being disposed");
    super.onClose();
  }
}
