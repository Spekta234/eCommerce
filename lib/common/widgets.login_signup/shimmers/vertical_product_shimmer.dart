import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class EVerticalProductShimmer extends StatelessWidget {
  const EVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      itemCount: itemCount,
      itemBuilder:
          (_, __) => const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                EShimmerEffects(width: 180, height: 180),
                SizedBox(height: ESizes.spaceBtwItems),

                /// Text
                EShimmerEffects(width: 140, height: 15),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                EShimmerEffects(width: 110, height: 15),
              ],
            ),
          ),
    );
  }
}
