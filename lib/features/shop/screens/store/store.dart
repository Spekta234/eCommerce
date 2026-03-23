import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/tabbar.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/search_container.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/products/cart/cart_menu.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/brands_shimmers.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/controllers/category_controller.dart';
import 'package:spekta_store/features/shop/screens/brand/all_brands.dart';
import 'package:spekta_store/features/shop/screens/brand/brand_products.dart';
import 'package:spekta_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets.login_signup/brands/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/product/brand_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featureCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: EAppBar(
          title: Text(
            'store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [ECartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    EHelperFunctions.isDarkMode(context)
                        ? EColors.black
                        : EColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: EdgeInsets.all(ESizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      SizedBox(height: ESizes.spaceBtwItems),
                      ESearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: ESizes.spaceBtwSections),

                      /// -- Featured Brands
                      ESectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() =>  AllBrands()),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 1.5),

                      /// -- Brands GRID
                      Obx(
                        () {
                          if(brandController.isLoading.value) return const EBrandShimmers();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                          }

                         return EGridLayout(
                           itemCount: brandController.featuredBrands.length,
                           mainAxisExtent: 80,
                           itemBuilder: (_, index) {
                             final brand = brandController.featuredBrands[index];
                             return EBrandCard(
                               showBorder: false, brand: brand,
                               onTap: () => Get.to(() =>  BrandProducts(brand: brand,)),
                             );
                           },
                         );
                        }
                      ),
                    ],
                  ),
                ),

                /// Tabs
                bottom: ETabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => ECategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}
