import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/features/dashboard/views/dashboard_view.dart';
import 'package:getxtest/features/fax/views/fax_view.dart';
import 'package:getxtest/features/navigation/controllers/main_navigation_controller.dart';
import 'package:getxtest/features/sms/views/sms_view.dart';

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
