import 'package:get/get.dart';
import 'package:getxtest/features/sms/services/sms_service.dart';

class SmsController extends GetxController {
  // In a real app, the controller might process data from the service.
  // Here we just expose the service's data.

  SmsService get service => Get.find<SmsService>(tag: 'session');

  List<String> get messages => service.messages;

  @override
  void onInit() {
    super.onInit();
    print("📱 SmsController: onInit() - Controller initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("📱 SmsController: onReady() - Controller ready for use");
  }

  @override
  void onClose() {
    print("📱 SmsController: onClose() - Controller being disposed");
    super.onClose();
  }
}
