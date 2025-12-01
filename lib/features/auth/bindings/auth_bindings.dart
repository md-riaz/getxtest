import 'package:get/get.dart';
import 'package:getxtest/features/auth/controllers/login_controller.dart';
import 'package:getxtest/features/auth/services/auth_service.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.lazyPut(() => LoginController());
    // Add other auth-related controllers/services here as needed
  }
}
