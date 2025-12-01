import 'package:get/get.dart';
import 'package:getxtest/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:getxtest/features/fax/bindings/fax_bindings.dart';
import 'package:getxtest/features/navigation/bindings/main_navigation_bindings.dart';
import 'package:getxtest/features/sms/bindings/sms_bindings.dart';

class SessionManagerBindings extends Bindings {
  static const String sessionTag = 'session';
  static bool _isCleaningUp = false;

  @override
  void dependencies() {
    print(
      "🎯 SessionManagerBindings: dependencies() - Starting session initialization",
    );

    // Initialize feature bindings with session tags
    _initializeFeatureBindings();
    print(
      "🎯 SessionManagerBindings: dependencies() - Session initialization completed",
    );
  }

  void _initializeFeatureBindings() {
    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - Initializing feature bindings",
    );

    // Initialize navigation bindings first
    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - Initializing Navigation bindings",
    );
    MainNavigationBindings(tag: sessionTag).dependencies();

    // Initialize feature bindings (SMS, Fax, etc.)
    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - Initializing SMS bindings",
    );
    SmsBindings(tag: sessionTag).dependencies();

    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - Initializing Fax bindings",
    );
    FaxBindings(tag: sessionTag).dependencies();

    // Initialize Dashboard feature last so it can access other feature controllers
    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - Initializing Dashboard bindings (last)",
    );
    DashboardBindings(tag: sessionTag).dependencies();

    print(
      "🎯 SessionManagerBindings: _initializeFeatureBindings() - All features initialized with session tag",
    );
  }

  static void terminateSession() {
    if (_isCleaningUp) {
      print(
        "🎯 SessionManagerBindings: terminateSession() - Cleanup already in progress, skipping",
      );
      return;
    }

    _isCleaningUp = true;
    print(
      "🎯 SessionManagerBindings: terminateSession() - Starting session cleanup",
    );

    try {
      // Modular session cleanup using drop() methods from feature bindings
      SmsBindings.drop(sessionTag);
      FaxBindings.drop(sessionTag);
      DashboardBindings.drop(sessionTag);
      print(
        "🎯 SessionManagerBindings: terminateSession() - Session dependencies terminated",
      );
    } catch (e) {
      print(
        "🎯 SessionManagerBindings: terminateSession() - Error during cleanup: $e",
      );
    }

    print(
      "🎯 SessionManagerBindings: terminateSession() - Session cleanup completed",
    );
    _isCleaningUp = false;
  }
}
