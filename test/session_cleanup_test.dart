import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getxtest/core/bindings/app_bindings.dart';
import 'package:getxtest/features/auth/services/auth_service.dart';
import 'package:getxtest/features/auth/views/login_view.dart';
import 'package:getxtest/features/dashboard/controllers/dashboard_controller.dart';
import 'package:getxtest/features/dashboard/views/dashboard_view.dart';
import 'package:getxtest/features/fax/controllers/fax_controller.dart';
import 'package:getxtest/features/fax/services/fax_service.dart';
import 'package:getxtest/features/sms/controllers/sms_controller.dart';
import 'package:getxtest/features/sms/services/sms_service.dart';
import 'package:getxtest/main.dart';

void main() {
  testWidgets('Session cleanup disposes controllers and services', (
    WidgetTester tester,
  ) async {
    // Ensure global bindings are initialized
    AppBindings().dependencies();
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Simulate login using the button
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Dashboard should appear
    expect(find.byType(DashboardView), findsOneWidget);

    // Simulate logout
    final logoutButton = find.byIcon(Icons.logout);
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pumpAndSettle();

    // Reset AuthService state after session cleanup
    if (Get.isRegistered<AuthService>()) {
      Get.find<AuthService>().clearState();
    }

    // Wait for all disposals to complete
    await tester.pumpAndSettle();

    // Login screen should reappear
    expect(find.byType(LoginView), findsOneWidget);

    // Debug print registration status before assertions
    print(
      'SmsController registered: [33m${Get.isRegistered<SmsController>(tag: 'session')}[0m',
    );
    print(
      'SmsService registered: [33m${Get.isRegistered<SmsService>(tag: 'session')}[0m',
    );
    print(
      'FaxController registered: [33m${Get.isRegistered<FaxController>(tag: 'session')}[0m',
    );
    print(
      'FaxService registered: [33m${Get.isRegistered<FaxService>(tag: 'session')}[0m',
    );
    print(
      'DashboardController registered: [33m${Get.isRegistered<DashboardController>(tag: 'session')}[0m',
    );

    // Check that session-tagged controllers and services are disposed
    expect(Get.isRegistered<SmsController>(tag: 'session'), isFalse);
    expect(Get.isRegistered<SmsService>(tag: 'session'), isFalse);
    expect(Get.isRegistered<FaxController>(tag: 'session'), isFalse);
    expect(Get.isRegistered<FaxService>(tag: 'session'), isFalse);
    expect(Get.isRegistered<DashboardController>(tag: 'session'), isFalse);
  });
}
