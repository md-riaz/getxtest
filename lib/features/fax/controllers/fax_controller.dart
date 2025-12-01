import 'package:get/get.dart';
import '../services/fax_service.dart';

class FaxController extends GetxController {
  FaxService get service => Get.find<FaxService>(tag: 'session');

  List<String> get faxes => service.faxes;

  @override
  void onInit() {
    super.onInit();
    print("📠 FaxController: onInit() - Controller initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("📠 FaxController: onReady() - Controller ready for use");
  }

  @override
  void onClose() {
    print("📠 FaxController: onClose() - Controller being disposed");
    super.onClose();
  }
}
