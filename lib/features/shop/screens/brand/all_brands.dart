import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/brands/brand_card.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/screens/brand/brand_products.dart';
import 'package:spekta_store/utils/constants/sizes.dart';


class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

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
              EGridLayout(itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      EBrandCard(showBorder: true,
                        onTap: () => Get.to(() => const EBrandProducts()),)),
            ],
          ),
        ),
      ),
    );
  }
}
