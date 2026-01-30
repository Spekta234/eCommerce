import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/loaders/loaders.dart';
import 'package:spekta_store/features/personalization/controllers/user_controller.dart';
import 'package:spekta_store/features/personalization/screens/profile/profile.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/full_screen_loader.dart';

/// Controller to manage user-related functionality.
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      // Start Loading
      // EFullScreenLoader.openLoadingDialog('We are processing your information....', EImages.docerAnimation);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      // EFullScreenLoader.stopLoading();
      // return;
      // }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show Success Message
      ELoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}