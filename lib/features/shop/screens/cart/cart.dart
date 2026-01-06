import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:spekta_store/features/shop/screens/checkout/checkout.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/products/cart/add_remove_button.dart';
import '../../../../common/widgets.login_signup/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),

        /// -- Items in Cart
        child: ECartItems()
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$256')),
      ),
    );
  }
}


