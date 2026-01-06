import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_price_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../common/widgets.login_signup/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attributes Pricing and Description
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
          children: [
            ESectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                EChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                EChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ESectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                EChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
                EChoiceChip(text: 'EU 38', selected: false, onSelected: (value){}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

