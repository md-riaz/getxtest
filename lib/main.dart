import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/apppages.dart';
import 'core/bindings/app_bindings.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/splash',
      getPages: AppPages.routes,
    );
  }
}
