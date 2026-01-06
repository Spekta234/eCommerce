import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/circular_container.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_circular_image.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ECircularImage(image: EImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Pictured')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Heading Personal Info
              const ESectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: ESizes.spaceBtwItems),

              EProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onPressed: (){}),
              EProfileMenu(title: 'E-Mail', value: 'coding_with_t', onPressed: (){}),
              EProfileMenu(title: 'Phone Number', value: '+234-810-9865-251', onPressed: (){}),
              EProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              EProfileMenu(title: 'Date of Birth', value: '25 April, 2006', onPressed: (){}),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: (){},
                    child: const Text('Close Account', style: TextStyle(color: Colors.red))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
