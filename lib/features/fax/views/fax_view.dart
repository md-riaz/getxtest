import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/fax_controller.dart';

class FaxView extends StatelessWidget {
  const FaxView({super.key});

  FaxController get controller => Get.find<FaxController>(tag: 'session');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fax')),
      body: Obx(() {
        if (controller.faxes.isEmpty) {
          return const Center(child: Text("No fax messages found."));
        }
        return ListView.builder(
          itemCount: controller.faxes.length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(controller.faxes[index])),
        );
      }),
    );
  }
}
