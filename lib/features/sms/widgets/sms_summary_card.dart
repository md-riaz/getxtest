import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/sms_bindings.dart';
import '../controllers/sms_controller.dart';
import '../views/sms_view.dart';

class SmsSummaryCard extends StatelessWidget {
  const SmsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SMS Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GetBuilder<SmsController>(
              tag: 'session',
              builder: (controller) => Obx(
                () => Text(
                  'You have ${controller.messages.length} new messages.',
                ),
              ),
            ),
            TextButton(
              child: const Text('View All'),
              onPressed: () => Get.to(
                () => const SmsView(),
                binding: SmsBindings(tag: 'session'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
