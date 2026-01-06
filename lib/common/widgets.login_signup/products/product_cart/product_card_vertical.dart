import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/styles/shadows.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/features/shop/screens/product_details/product_details.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../icons/e_circular_icon.dart';
import '../../images/e_rounded_image.dart';
import '../../texts/e_brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadows
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.darkerGrey : EColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            ERoundedContainer(
              height: 186,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: dark ? EColors.dark : EColors.light,
              child: Stack(
                children: [
                  /// -- Product Image
                  ERoundedImage(
                    imageUrl: EImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// -- Sale tag
                  Positioned(
                    top: 12,
                    child: ERoundedContainer(
                      radius: ESizes.sm,
                      backgroundColor: EColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: ESizes.sm,
                        vertical: ESizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: Colors.black),
                      ),
                    ),
                  ),

                  /// -- Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: ECircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: ESizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EProductTitleText(
                      title: 'Nike MK2 Tekno White',
                      smallSize: true,
                    ),
                    const SizedBox(height: ESizes.spaceBtwItems / 2),
                    EBrandTitleWithVerifiedIcon(title: 'Nike'),
                  ],
                ),
              ),
            ),

            // Use Spacer() to utilize all the space to set the price and the cart button at bottom.
            // This usually happens when Product title is in single line or 2 lines (Max)
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: EdgeInsets.only(left: ESizes.sm),
                  child: EProductPriceText(price: '35.0'),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: EColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ESizes.cardRadiusLg),
                      bottomRight: Radius.circular(ESizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: ESizes.iconLg * 1.2,
                    height: ESizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: EColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

