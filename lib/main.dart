import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/app_bindings.dart';
import 'features/auth/views/login_view.dart';

void main() {
  // Initialize app bindings before starting the app
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Modular Architecture',
      home: const LoginView(),
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    );
  }
}
