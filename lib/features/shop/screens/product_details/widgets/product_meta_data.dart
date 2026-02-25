import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/images/e_circular_image.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/e_brand_title_text_with_verified_icon.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:spekta_store/features/shop/controllers/product/product_controller.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/constants/enums.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../utils/enums/enums.dart';

class EProductMetaData extends StatelessWidget {
  const EProductMetaData({super.key, required this.product});

  final ProductModel  product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = EHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black)),
            ),
            const SizedBox(width: ESizes.spaceBtwItems),

            /// Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: ESizes.spaceBtwItems),
            EProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(width: ESizes.spaceBtwItems / 1.5),

        /// Title
        EProductTitleText(title: product.title),
        const SizedBox(height: ESizes.spaceBtwItems /1.5),

        /// Stock Status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text(controller.getProductsStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems /1.5),

        /// Brand
        Row(
          children: [
            ECircularImage(
              image: product.brand !=null? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode? EColors.white : EColors.black,
            ),
             EBrandTitleWithVerifiedIcon(title: product.brand != null? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
