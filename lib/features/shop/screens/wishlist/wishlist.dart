import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/icons/e_circular_icon.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/loaders/animation_loader.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_vertical.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/vertical_product_shimmer.dart';
import 'package:spekta_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:spekta_store/features/shop/screens/home/home.dart';
import 'package:spekta_store/navigation_menu.dart';
import 'package:spekta_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;
    return Scaffold(
      appBar: EAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ECircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),

          /// Products Grid
          child:  Obx(
            () => FutureBuilder(
              future: controller.favoriteProduct(),
              builder: (context, snapshot) {
                /// Nothing Found Widget
                // final emptyWidget = EAnimatedLoaderWidget(
                //   text: 'Whoops! Wishlist is Empty....',
                //   animation: EImages.pencilAnimation,
                //   showAction: true,
                //   actionText: 'Let\'s add some',
                //   onActionPressed: () => Get.off(() => const NavigationMenu()),
                // );

                const loader = EVerticalProductShimmer(itemCount: 6);
                final widget = ECloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader,
                  //nothingFound: emptyWidget,
                );
                if (widget !=null) return widget;

                final products = snapshot.data!;
                return EGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => EProductCardVertical(product: products[index]),
                );
              }
            ),
          )
        ),
      ),
    );
  }
}
