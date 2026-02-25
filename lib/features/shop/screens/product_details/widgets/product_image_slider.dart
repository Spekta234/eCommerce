import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../../common/widgets.login_signup/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets.login_signup/icons/e_circular_icon.dart';
import '../../../../../common/widgets.login_signup/images/e_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controllers/product/image_controller.dart';
import '../../../models/product_model.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return ECurvedEdgeWidget(
      child: Container(
        color: dark ? EColors.darkerGrey : EColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ESizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_,__, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress, color: EColors.primary),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder:
                      (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder:
                      (_, index) => Obx(
                        () {
                          final imageSelected = controller.selectedProductImage.value == images[index];
                          return ERoundedImage(
                            width: 80,
                            isNetworkImage: true,
                            imageUrl: images[index],
                            padding: const EdgeInsets.all(ESizes.sm),
                            backgroundColor: dark ? EColors.dark : EColors.white,
                            onPressed: () => controller.selectedProductImage.value = images[index],
                            border: Border.all(color: imageSelected? EColors.primary : Colors.transparent),
                          );
                        }
                      ),
                ),
              ),
            ),

            /// AppBar Icons
            const EAppBar(
              showBackArrow: true,
              actions: [ECircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
