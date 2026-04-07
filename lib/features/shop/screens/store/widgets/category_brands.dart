import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/boxes_shimmer.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/list_tile_shimmer.dart';
import 'package:spekta_store/features/shop/controllers/product/brand_controller.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets.login_signup/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        /// Handle Loader, No Record, OR Error Message
        const loader  = Column(
          children: [
            EListTileShimmer(),
            SizedBox(height: ESizes.spaceBtwItems),
            EBoxesShimmer(),
            SizedBox(height: ESizes.spaceBtwItems),
          ],
        );

        final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader );
        if (widget !=null) return widget;

        /// Record Found!
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {

                /// Handle Loader, No Record, OR Error Message
                final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader );
                if (widget !=null) return widget;

                /// Record Found!
                final products = snapshot.data!;

                return EBrandShowCase(brand: brand, images: products.map((e) => e.thumbnail).toList());
              }
            );
          },
        );
      }
    );
  }
}
