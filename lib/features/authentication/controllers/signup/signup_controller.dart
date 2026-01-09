import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for last name input
  final username = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for first name input
  final phoneNumber = TextEditingController(); // controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation


  /// -- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      EFullScreenLoader.openLoadingDialog('We are processing your information....', EImages.docerAnimation);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check

      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Save Success Message

      // Move to verify Email Screen
    } catch (e) {
      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      EFullScreenLoader.stopLoading();
    }
  }
}