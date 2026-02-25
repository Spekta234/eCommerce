import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/features/shop/controllers/product/variation_controller.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../common/widgets.login_signup/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attributes Pricing and Description
        // Display variations price and stock when some variation is selected
        if (controller.selectedVariation.value.id.isNotEmpty)
        ERoundedContainer(
          padding: const EdgeInsets.all(ESizes.md),
          backgroundColor: dark ? EColors.darkerGrey : EColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock
              Row(
                children: [
                  const ESectionHeading(
                    title: 'variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: ESizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const EProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(width: ESizes.spaceBtwItems),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: ESizes.spaceBtwItems),

                          /// Sale Price
                          const EProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const EProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              EProductTitleText(
                title: 'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ESectionHeading(title: attribute.name ?? '', showActionButton: false),
                  SizedBox(height: ESizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: 8,
                    children: attribute.values!
                      .map((attributeValue) {

                        final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                        final available = controller
                            .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                            .contains(attributeValue);

                        return EChoiceChip(text: attributeValue, selected: isSelected, onSelected: null);
                    }).toList())
                ],
              )
          ).toList()
        )


      ],
    );
  }
}

