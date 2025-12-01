import 'package:get/get.dart';
import 'package:getxtest/core/services/api_service.dart';
import 'package:getxtest/features/auth/bindings/auth_bindings.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(), permanent: true);
    AuthBindings().dependencies();
  }
}
