import 'package:get/get.dart';
import 'package:getxtest/features/auth/services/auth_service.dart';
import 'package:getxtest/features/fax/controllers/fax_controller.dart';
import 'package:getxtest/features/sms/controllers/sms_controller.dart';

enum Feature { sms, fax }

class DashboardController extends GetxController {
  final availableFeatures = <Feature>[].obs;
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    print("🏠 DashboardController: onInit() - Controller initialized");
    _determineAvailableFeatures();
  }

  @override
  void onReady() {
    super.onReady();
    print("🏠 DashboardController: onReady() - Controller ready for use");
  }

  @override
  void onClose() {
    print("🏠 DashboardController: onClose() - Controller being disposed");
    super.onClose();
  }

  void _determineAvailableFeatures() {
    print(
      "🏠 DashboardController: _determineAvailableFeatures() - Checking available features",
    );
    final features = <Feature>[];

    // Check if controllers are registered in the 'session' tag group
    if (Get.isRegistered<SmsController>(tag: 'session')) {
      print(
        "🏠 DashboardController: _determineAvailableFeatures() - SMS feature available",
      );
      features.add(Feature.sms);
    }
    if (Get.isRegistered<FaxController>(tag: 'session')) {
      print(
        "🏠 DashboardController: _determineAvailableFeatures() - Fax feature available",
      );
      features.add(Feature.fax);
    }

    availableFeatures.assignAll(features);
    print(
      "🏠 DashboardController: _determineAvailableFeatures() - ${features.length} features available",
    );
  }

  void logout() {
    print("🏠 DashboardController: logout() - Logout button pressed");
    _authService.logout();
  }
}
