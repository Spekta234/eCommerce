import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_rounded_image.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/e_brand_title_text_with_verified_icon.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:spekta_store/common/widgets.login_signup/products/favorite_icon/favorite_icon.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/enums/enums.dart';
import '../../../styles/shadows.dart';
import '../../icons/e_circular_icon.dart';

class EProductCardHorizontal extends StatelessWidget {
  const EProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ESizes.productImageRadius),
        color: dark ? EColors.darkerGrey : EColors.grey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          ERoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ESizes.sm),
            backgroundColor: dark ? EColors.dark : EColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: ERoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                /// -- Sale tag
                if (salePercentage != null)
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
                      '$salePercentage',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: Colors.black),
                    ),
                  ),
                ),

                /// -- Favorite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: EFavoriteIcon(productId: product.id),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: ESizes.sm, left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EProductTitleText(title: product.title, smallSize: true),
                      SizedBox(height: ESizes.spaceBtwItems / 2),
                      EBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),

                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: EdgeInsets.only(left: ESizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),

                            /// Price, Show sale price as main if sale exist.
                            Padding(
                              padding: const EdgeInsets.only(left: ESizes.sm),
                              child: EProductPriceText(price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
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
          ),
        ],
      ),
    );
  }
}
