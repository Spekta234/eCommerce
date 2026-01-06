import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:spekta_store/common/widgets.login_signup/icons/e_circular_icon.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_rounded_image.dart';
import 'package:spekta_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:spekta_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:spekta_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:spekta_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:spekta_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets.login_signup/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: EBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            EProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(right: ESizes.defaultSpace, left: ESizes.defaultSpace, bottom: ESizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  ERatingAndShare(),
                  
                  /// - Price, Title, Stack and Brand
                  EProductMetaData(),
                  
                  /// - Attributes
                  EProductAttributes(),
                  const SizedBox(height: ESizes.spaceBtwSections),
                  
                  /// - Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  const SizedBox(height: ESizes.spaceBtwSections),
                  
                  /// - Description
                  const ESectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for BLue Sleeve less vest. There are more things that can be added vut i and ssssssssssssssss',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Review
                  const Divider(),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: Icon(Iconsax.arrow_right_3, size: 18,))
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


