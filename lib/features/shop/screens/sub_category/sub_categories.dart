import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_rounded_image.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_horizontal.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/appbar/appbar.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ERoundedImage(width: double.infinity, imageUrl: EImages.productBanner1, applyImageRadius: true, fit: BoxFit.cover),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  ESectionHeading(title: 'Sports Shirt', onPressed: (){}),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
                      itemBuilder: (context, index) => const EProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
