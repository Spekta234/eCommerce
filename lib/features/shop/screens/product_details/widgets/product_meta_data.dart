import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_circular_image.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/e_brand_title_text_with_verified_icon.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/constants/enums.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

class EProductMetaData extends StatelessWidget {
  const EProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
              child: Text('255', style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black)),
            ),
            const SizedBox(width: ESizes.spaceBtwItems),

            /// Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ESizes.spaceBtwItems),
            EProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: ESizes.spaceBtwItems / 1.5),

        /// Title
        const EProductTitleText(title: 'Nike MK2 Tekno White'),
        const SizedBox(height: ESizes.spaceBtwItems /1.5),

        /// Stock Status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems /1.5),

        /// Brand
        Row(
          children: [
            ECircularImage(
              image: EImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode? EColors.white : EColors.black,
            ),
            const EBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
