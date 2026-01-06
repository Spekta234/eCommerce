import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:spekta_store/features/authentication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:spekta_store/features/authentication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:spekta_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:spekta_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: EImages.onBoardingImage1,
                title: ETexts.onBoardingTitle1,
                subtitle: ETexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EImages.onBoardingImage2,
                title: ETexts.onBoardingTitle2,
                subtitle: ETexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EImages.onBoardingImage3,
                title: ETexts.onBoardingTitle3,
                subtitle: ETexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}


