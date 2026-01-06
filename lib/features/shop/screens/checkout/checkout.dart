import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/success_screen/success_screen.dart';
import 'package:spekta_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:spekta_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:spekta_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:spekta_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:spekta_store/navigation_menu.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../common/widgets.login_signup/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///  -- Items in Cart
              const ECartItems(showAddRemoveButtons: false),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// -- Coupon TextField
              ECouponCode(),
              const SizedBox(height: ESizes.defaultSpace),

              /// -- Billing Section
              ERoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: dark ? EColors.black : EColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    EBillingAmountSection(),
                    const SizedBox(height: ESizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: ESizes.spaceBtwItems),

                    /// Payment Methods
                    EBillingPaymentSection(),
                    const SizedBox(height: ESizes.spaceBtwItems),

                    /// Address
                    EBillingAddressSection(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(onPressed: () =>
            Get.to(() =>
                SuccessScreen(image: EImages.successfulPaymentIcon,
                    title: 'Payment Successful!',
                    subtitle: 'Your item will be shipped soon',
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                ),
            ),
            child: Text('Checkout \$256')),
      ),
    );
  }
}

