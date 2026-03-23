import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/features/shop/controllers/all_products_controller.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cart/product_card_vertical.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;


  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing products sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // sort products based on selected option
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwSections),
        /// Products
        Obx(
          () => EGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => EProductCardVertical(product: controller.products[index]),
          ),
        )
      ],
    );
  }
}