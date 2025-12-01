import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getxtest/features/auth/services/auth_service.dart';
import 'package:getxtest/main.dart';

void main() {
  testWidgets('App starts and shows login screen', (WidgetTester tester) async {
    // Register AuthService before building the app
    Get.put(AuthService());

    await tester.pumpWidget(const MyApp());

    // Verify that the login button is shown.
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
