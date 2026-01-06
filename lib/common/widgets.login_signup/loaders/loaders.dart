
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/utils/constants/colors.dart';

class ELoaders {

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: EColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: EColors.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: EColors.white,
    backgroundColor: Colors.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2, color: EColors.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: EColors.white),
    );
  }
}