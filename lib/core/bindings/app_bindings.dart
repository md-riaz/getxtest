import 'package:get/get.dart';

import '../../features/auth/services/auth_service.dart';
import '../services/api_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(), permanent: true);
    Get.put(AuthService(), permanent: true);
  }
}
