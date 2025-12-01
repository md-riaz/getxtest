import 'package:get/get.dart';

class FaxService extends GetxService {
  final faxes = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("📠 FaxService: onInit() - Service initialized");
    // Simulate fetching faxes
    faxes.addAll(['Fax from Office', 'Invoice #123']);
    print("📠 FaxService: onInit() - ${faxes.length} faxes loaded");
  }

  @override
  void onReady() {
    super.onReady();
    print("📠 FaxService: onReady() - Service ready for use");
  }

  @override
  void onClose() {
    print("📠 FaxService: onClose() - Service being disposed");
    super.onClose();
  }
}
