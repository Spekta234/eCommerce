
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository  get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    // Check if it's the first time launching the app
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen()) // Redirect to login screen if not the first time
        : Get.offAll(const OnboardingScreen()); // Redirect to onboarding screen if it's the first time
  }


/* ---------------------------------- Email & Password sign-in ---------------------------------*/


  ///  [EmailAuthentication] - SignIn

}