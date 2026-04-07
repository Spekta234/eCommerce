import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_vertical.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/vertical_product_shimmer.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/controllers/category_controller.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/features/shop/screens/all_products/all_produts.dart';
import 'package:spekta_store/features/shop/screens/store/widgets/category_brands.dart';

import '../../../../../common/widgets.login_signup/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key, required this.category});

   
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// -- Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context,snapshot) {

                  /// Helper Function: Handle loader, No Record, Or Error Message
                  final response = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: const EVerticalProductShimmer() );
                  if (response !=null) return response;
                  
                  /// Record Found
                  final products = snapshot.data!;
                  
                  return Column(
                    children: [
                      ESectionHeading(title: 'You might like',
                        onPressed: () => Get.to(AllProducts(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                          ))
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems),
                      EGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => EProductCardVertical(product: products[index]),
                      ),
                  
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
