import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  static void drop(String tag) {
    Get.delete<DashboardController>(tag: tag, force: true);
  }

  final String? tag;

  DashboardBindings({this.tag});

  @override
  void dependencies() {
    final sessionTag = tag ?? 'session';

    // Register DashboardController with session tag
    Get.put(DashboardController(), tag: sessionTag);
  }
}
