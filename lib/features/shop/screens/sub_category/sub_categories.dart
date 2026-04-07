import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_rounded_image.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_horizontal.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/horizontal_product_shimmer.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/controllers/category_controller.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';
import 'package:spekta_store/features/shop/screens/all_products/all_produts.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets.login_signup/appbar/appbar.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: EAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ERoundedImage(width: double.infinity, imageUrl: EImages.productBanner1, applyImageRadius: true, fit: BoxFit.cover),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  /// Handle Loader, No Record, Or Error Message
                  const loader = EHorizontalProductShimmer();
                  final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                  if (widget !=null) return widget;
                  
                  /// Record Found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      
                      final subCategory = subCategories[index];


                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                          final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                          if (widget !=null) return widget;

                          /// Record Found
                          final products = snapshot.data!;


                          return Column(
                            children: [
                              /// Heading
                              ESectionHeading(
                                title: category.name,
                                onPressed: () => Get.to(
                                    () => AllProducts(
                                      title: subCategory.name,
                                      futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                    ),
                                ),

                              ),
                              const SizedBox(height: ESizes.spaceBtwItems / 2),

                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
                                  itemBuilder: (context, index) => EProductCardHorizontal(product: products[index]),
                                ),
                              ),

                              const SizedBox(height: ESizes.spaceBtwSections)
                            ],
                          );
                        }
                      );
                    },
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
