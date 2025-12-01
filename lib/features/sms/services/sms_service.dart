import 'package:get/get.dart';

class SmsService extends GetxService {
  final messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("📱 SmsService: onInit() - Service initialized");
    // Simulate fetching messages
    messages.addAll(['Hello', 'Your OTP is 1234', 'Welcome to GetX']);
    print("📱 SmsService: onInit() - ${messages.length} messages loaded");
  }

  @override
  void onReady() {
    super.onReady();
    print("📱 SmsService: onReady() - Service ready for use");
  }

  @override
  void onClose() {
    print("📱 SmsService: onClose() - Service being disposed");
    super.onClose();
  }
}
