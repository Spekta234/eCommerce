import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/e_rounded_image.dart';
import '../../texts/e_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        ERoundedImage(
          imageUrl: EImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ESizes.sm),
          backgroundColor:
              EHelperFunctions.isDarkMode(context)
                  ? EColors.darkerGrey
                  : EColors.light,
        ),
        const SizedBox(width: ESizes.spaceBtwItems),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: EProductTitleText(
                  title: 'Nike MK2 Tekno White',
                  maxLines: 1,
                ),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Uk 08 ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
