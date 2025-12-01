import 'package:get/get.dart';

import '../controllers/sms_controller.dart';
import '../services/sms_service.dart';

class SmsBindings extends Bindings {
  static void drop(String tag) {
    Get.delete<SmsService>(tag: tag, force: true);
    Get.delete<SmsController>(tag: tag, force: true);
  }

  final String? tag;

  SmsBindings({this.tag});

  @override
  void dependencies() {
    final sessionTag = tag ?? 'session';

    // Register SmsService with the session tag
    Get.put(SmsService(), tag: sessionTag);

    // Register SmsController with the same session tag
    Get.lazyPut(() => SmsController(), tag: sessionTag);
  }
}
