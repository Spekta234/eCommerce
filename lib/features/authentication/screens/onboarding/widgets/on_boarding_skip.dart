import 'package:flutter/material.dart';
import 'package:spekta_store/features/authentication/controllers/onboarding/onboarding_controllers.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: EDeviceUtils.getAppBarHeight(),
      right: ESizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: Text("Skip")),
    );
  }
}