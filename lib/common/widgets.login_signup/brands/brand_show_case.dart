import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      showBorder: true,
      borderColor: EColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product Count
          const EBrandCard(showBorder: false),
          const SizedBox(height: ESizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children:
            images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: ERoundedContainer(
        height: 100,
        backgroundColor:
        EHelperFunctions.isDarkMode(context)
            ? EColors.darkerGrey
            : EColors.light,
        margin: const EdgeInsets.only(right: ESizes.sm),
        padding: const EdgeInsets.all(ESizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}