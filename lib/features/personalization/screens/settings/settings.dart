import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/primary_header_contaier.dart';
import 'package:spekta_store/common/widgets.login_signup/list_tiles/settings_menu_tile.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/data/repositories/authentication/authentication_repository.dart';
import 'package:spekta_store/features/personalization/screens/address/address.dart';
import 'package:spekta_store/features/personalization/screens/profile/profile.dart';
import 'package:spekta_store/features/shop/screens/order/order.dart';
import 'package:spekta_store/utils/constants/colors.dart';

import '../../../../common/widgets.login_signup/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            EPrimaryHeaderContainer(
              child: Column(
                children: [
                  EAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: EColors.white),
                    ),
                  ),
        
                  /// User Profile Card
                  EUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: ESizes.spaceBtwSections),
                ],
              ),
            ),
        
            /// -- Body
            Padding(
              padding: EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  ESectionHeading(title: 'Account Settings', showActionButton: false,),
                  SizedBox(height: ESizes.spaceBtwItems),
        
                  ESettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address', onTap: () => Get.to(() => UserAddressScreen())),
                  ESettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout', onTap: (){}),
                  ESettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen())),
                  ESettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: (){}),
                  ESettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons', onTap: (){}),
                  ESettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: (){}),
                  ESettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: (){}),
        
                  /// -- App Settings
                  SizedBox(height: ESizes.spaceBtwSections),
                  ESectionHeading(title: 'App Settings', showActionButton: false),
                  SizedBox(height: ESizes.spaceBtwItems),
                  ESettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  ESettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: ESizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout')),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

