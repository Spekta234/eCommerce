import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/brands/brand_card.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/controllers/product/brand_controller.dart';
import 'package:spekta_store/features/shop/models/brand_model.dart';
import 'package:spekta_store/features/shop/screens/brand/brand_products.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/shimmers/brands_shimmers.dart';


class AllBrands extends StatelessWidget {
   AllBrands({super.key});

  final brandController = BrandController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              ESectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: ESizes.spaceBtwItems),

              /// -- Brands
              Obx(
                      () {
                    if(brandController.isLoading.value) return const EBrandShimmers();

                    if (brandController.allBrands.isEmpty) {
                      return Center(
                          child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                    }

                    return EGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return EBrandCard(showBorder: false, brand: brand,);
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
