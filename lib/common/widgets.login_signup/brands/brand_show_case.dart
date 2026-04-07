import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';
import 'package:spekta_store/features/shop/screens/brand/brand_products.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({super.key, required this.images, required this.brand});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: ERoundedContainer(
        showBorder: true,
        borderColor: EColors.darkerGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ESizes.md),
        margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Product Count
            EBrandCard(showBorder: false, brand: brand),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const EShimmerEffects(width: 100, height: 100),
          errorWidget: (context, url, error) =>  const Icon(Icons.error),
        )
      ),
    );
  }
}