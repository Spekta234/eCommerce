import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';
import 'package:spekta_store/features/shop/controllers/banner_controller.dart';
import 'package:spekta_store/features/shop/controllers/home_controllers.dart';

import '../../../../../common/widgets.login_signup/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets.login_signup/images/e_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) return const EShimmerEffects(width: double.infinity, height: 190);

        // No Data F0und
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                ),
                items:
                controller.banners
                    .map(
                      (banner) => ERoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                    fit: BoxFit.fill,
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              Center(
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        ECircularContainer(
                          width: 20,
                          height: 4,
                          margin: EdgeInsets.only(right: 10),
                          backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? EColors.primary
                              : EColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }
    );
  }
}
