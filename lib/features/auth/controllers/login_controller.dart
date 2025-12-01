import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    print("🔑 LoginController: onInit() - Controller initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("🔑 LoginController: onReady() - Controller ready for use");
  }

  @override
  void onClose() {
    print("🔑 LoginController: onClose() - Controller being disposed");
    super.onClose();
  }

  void login() {
    print("🔑 LoginController: login() - Login button pressed");
    _authService.login();
  }
}
