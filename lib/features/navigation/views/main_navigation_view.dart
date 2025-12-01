import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../fax/views/fax_view.dart';
import '../../sms/views/sms_view.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  MainNavigationController get controller =>
      Get.find<MainNavigationController>(tag: 'session');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex,
          children: const [DashboardView(), SmsView(), FaxView()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.sms), label: 'SMS'),
            BottomNavigationBarItem(icon: Icon(Icons.fax), label: 'Fax'),
          ],
        ),
      ),
    );
  }
}
