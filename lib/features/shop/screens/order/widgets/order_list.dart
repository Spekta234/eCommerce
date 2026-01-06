import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../utils/constants/sizes.dart';

class EOrderListItems extends StatelessWidget {
  const EOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwItems),
      itemBuilder:
          (_, index) => ERoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(ESizes.md),
            backgroundColor: dark ? EColors.dark : EColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// -- Row 1
                Row(
                  children: [
                    /// 1 - Icon
                    Icon(Iconsax.ship),
                    SizedBox(width: ESizes.spaceBtwItems / 2),

                    /// 2 - Status & Data
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: EColors.primary,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text(
                            '26 Oct 2025',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),

                    /// 3 - Icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: ESizes.iconSm,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// -- Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          Icon(Iconsax.tag),
                          SizedBox(width: ESizes.spaceBtwItems / 2),

                          /// 2 - Status & Data
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.apply(
                                    color: EColors.primary,
                                    fontWeightDelta: 1,
                                  ),
                                ),
                                Text(
                                  '[#256f2]',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          Icon(Iconsax.calendar),
                          SizedBox(width: ESizes.spaceBtwItems / 2),

                          /// 2 - Status & Data
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Data',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.apply(
                                    color: EColors.primary,
                                    fontWeightDelta: 1,
                                  ),
                                ),
                                Text(
                                  '17 Nov 2025',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
