import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

class EListTileShimmer extends StatelessWidget {
  const EListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EShimmerEffects(width: 50, height: 40, radius: 50),
            SizedBox(width: ESizes.spaceBtwItems),
            Column(
              children: [
                EShimmerEffects(width: 100, height: 15),
                SizedBox(height: ESizes.spaceBtwItems),
                EShimmerEffects(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
