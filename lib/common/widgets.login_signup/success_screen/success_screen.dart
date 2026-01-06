import 'package:flutter/material.dart';
import 'package:spekta_store/common/styles/spacing_styles.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(image: AssetImage(image), width: EHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: ESizes.spaceBtwSections,),

              /// Title & Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwSections,),

              /// Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(ETexts.toContinue)),),
            ],
          ),
        ),
      ),
    );
  }
}
