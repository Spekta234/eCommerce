import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_vertical.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/vertical_product_shimmer.dart';
import 'package:spekta_store/features/shop/controllers/product/product_controller.dart';
import 'package:spekta_store/features/shop/screens/all_products/all_produts.dart';
import 'package:spekta_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:spekta_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:spekta_store/features/shop/screens/home/widgets/promo_widget.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/custom_shapes/containers/primary_header_contaier.dart';
import '../../../../common/widgets.login_signup/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets.login_signup/layouts/grid_layout.dart';
import '../../../../common/widgets.login_signup/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  const EHomeAppBar(),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /// -- Search Bar
                  const ESearchContainer(text: 'Search in Store'),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /// -- Categories
                  Padding(
                    padding: const EdgeInsets.only(left: ESizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        ESectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: ESizes.spaceBtwItems),

                        /// -- Categories
                        EHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: ESizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  EPromoSlider(),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// -- Heading
                  ESectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /// -- Popular Products
                  Obx(() {
                    if (controller.isLoading.value)
                      return const EVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return EGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => EProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
