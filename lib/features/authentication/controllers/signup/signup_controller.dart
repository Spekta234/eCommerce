import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/data/repositories/authentication/authentication_repository.dart';
import 'package:spekta_store/data/repositories/user/user_repository.dart';
import 'package:spekta_store/features/authentication/screens/signup/verify_email.dart';
import 'package:spekta_store/utils/models/user_model.dart';
import 'package:spekta_store/utils/popups/loaders.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for last name input
  final username = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for first name input
  final phoneNumber =
      TextEditingController(); // controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation
  final userRepository = Get.put(UserRepository());

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      // EFullScreenLoader.openLoadingDialog('We are processing your information....', EImages.docerAnimation);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) return;

      // Form Validation
      // if (!signupFormKey.currentState!.validate()) {
      //   // Remove Loader
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      // Privacy Policy Check
      // if (!privacyPolicy.value) {
      //   ELoaders.warningSnackBar(
      //       title: 'Accept Privacy Policy',
      //       message: 'In order to create an account, you must read and accept the Privacy Policy & Terms of Use',
      //   );
      //   return;
      // }

      // print('IM ALREADYY HEREEEEEEEEEEE');

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Save Success Message
      ELoaders.successSnackBar(
        title: 'Success',
        message:
            'Your account has been created! Please verify your email to continue',
      );

      // Move to verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
