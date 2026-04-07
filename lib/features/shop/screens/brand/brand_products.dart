import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/brands/brand_card.dart';
import 'package:spekta_store/common/widgets.login_signup/products/sortable/sortable_products.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/vertical_product_shimmer.dart';
import 'package:spekta_store/features/shop/controllers/product/brand_controller.dart';
import 'package:spekta_store/features/shop/models/brand_model.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: EAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              EBrandCard(showBorder: true, brand: brand),
              SizedBox(height: ESizes.spaceBtwItems),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  /// Handle loader, No Record, OR Error Message
                  const loader = EVerticalProductShimmer();
                  final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record Found!
                  final brandProducts = snapshot.data!;
                  return ESortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
