import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/features/fax/controllers/fax_controller.dart';

class FaxSummaryCard extends StatelessWidget {
  const FaxSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fax Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GetBuilder<FaxController>(
              tag: 'session',
              builder: (controller) => Obx(
                () => Text('You have ${controller.faxes.length} new faxes.'),
              ),
            ),
            // No "View All" button as we haven't implemented FaxView
          ],
        ),
      ),
    );
  }
}
