import 'package:get/get.dart';

import '../controllers/main_navigation_controller.dart';

class MainNavigationBindings extends Bindings {
  final String? tag;

  MainNavigationBindings({this.tag});

  @override
  void dependencies() {
    final sessionTag = tag ?? 'session';

    Get.lazyPut<MainNavigationController>(
      () => MainNavigationController(),
      tag: sessionTag,
    );
  }
}
