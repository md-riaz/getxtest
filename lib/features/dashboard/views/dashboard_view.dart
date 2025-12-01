import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fax/widgets/fax_summary_card.dart';
import '../../sms/widgets/sms_summary_card.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  DashboardController get controller =>
      Get.find<DashboardController>(tag: 'session');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.availableFeatures.isEmpty) {
          return const Center(child: Text("No features available."));
        }
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            for (final feature in controller.availableFeatures)
              _buildFeatureWidget(feature),
          ],
        );
      }),
    );
  }

  Widget _buildFeatureWidget(Feature feature) {
    switch (feature) {
      case Feature.sms:
        return const SmsSummaryCard();
      case Feature.fax:
        return const FaxSummaryCard();
    }
  }
}
