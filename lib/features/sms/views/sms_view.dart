import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sms_controller.dart';

class SmsView extends StatelessWidget {
  const SmsView({super.key});

  SmsController get controller => Get.find<SmsController>(tag: 'session');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMS')),
      body: Obx(() {
        if (controller.messages.isEmpty) {
          return const Center(child: Text("No SMS messages found."));
        }
        return ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(controller.messages[index])),
        );
      }),
    );
  }
}
