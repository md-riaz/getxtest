import 'package:get/get.dart';
import 'package:getxtest/features/fax/controllers/fax_controller.dart';
import 'package:getxtest/features/fax/services/fax_service.dart';

class FaxBindings extends Bindings {
  static void drop(String tag) {
    Get.delete<FaxService>(tag: tag, force: true);
    Get.delete<FaxController>(tag: tag, force: true);
  }

  static const String defaultSessionTag = 'session';
  final String tag;

  FaxBindings({this.tag = defaultSessionTag});

  @override
  void dependencies() {
    print(
      "📠 FaxBindings: dependencies() - Initializing Fax dependencies with tag: $tag",
    );

    print("📠 FaxBindings: dependencies() - Creating FaxService instance");
    Get.put(FaxService(), tag: tag);

    print("📠 FaxBindings: dependencies() - Creating FaxController instance");
    Get.put(FaxController(), tag: tag);

    print(
      "📠 FaxBindings: dependencies() - Fax dependencies initialization completed",
    );
  }
}
