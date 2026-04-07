import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class EBoxesShimmer extends StatelessWidget {
  const EBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EShimmerEffects(width: 150, height: 100)),
            SizedBox(width: ESizes.spaceBtwItems),
            Expanded(child: EShimmerEffects(width: 150, height: 110)),
            SizedBox(width: ESizes.spaceBtwItems),
            Expanded(child: EShimmerEffects(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
