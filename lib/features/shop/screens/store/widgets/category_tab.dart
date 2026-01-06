import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_vertical.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';

import '../../../../../common/widgets.login_signup/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const EBrandShowCase(
                images: [
                  EImages.productImage1,
                  EImages.productImage2,
                  EImages.productImage1,
                ],
              ),
              const EBrandShowCase(
                images: [
                  EImages.productImage1,
                  EImages.productImage2,
                  EImages.productImage1,
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// -- Products
              ESectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: ESizes.spaceBtwItems),

              EGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => EProductCardVertical(),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
