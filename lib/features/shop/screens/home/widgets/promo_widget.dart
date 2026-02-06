import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/features/shop/controllers/banner_controller.dart';
import 'package:spekta_store/features/shop/controllers/home_controllers.dart';

import '../../../../../common/widgets.login_signup/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets.login_signup/images/e_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EPromoSlider extends StatelessWidget{
  const EPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => ERoundedImage(imageUrl: url, fit: BoxFit.fill,)).toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        Center(
          child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)  ECircularContainer(width: 20, height: 4, margin: EdgeInsets.only(right: 10), backgroundColor: controller.carousalCurrentIndex.value == i ? EColors.primary : EColors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}