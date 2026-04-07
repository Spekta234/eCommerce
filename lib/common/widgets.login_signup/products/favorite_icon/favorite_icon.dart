import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:spekta_store/utils/constants/colors.dart';

import '../../icons/e_circular_icon.dart';

class EFavoriteIcon extends StatelessWidget {
  const EFavoriteIcon({super.key, required this.productId});

  final String productId;
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(
      () => ECircularIcon(
      icon: controller.isFavorites(productId) ? Iconsax.heart5 : Iconsax.heart,
      color: controller.isFavorites(productId) ? EColors.error : null,
      onPressed: () => controller.toggleFavoriteProduct(productId),  
      ),
    );
  }
}
