import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';
import 'package:spekta_store/features/personalization/controllers/user_controller.dart';
import 'package:spekta_store/features/shop/screens/cart/cart.dart';

import '../../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../../common/widgets.login_signup/products/cart/cart_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Text(ETexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const EShimmerEffects(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white));
            }
          }),
        ],
      ),
      actions: [
        ECartCounterIcon(onPressed: (){}, iconColor: EColors.white,),
      ],
    );
  }
}