import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class ECategoryShimmer extends StatelessWidget {
  const ECategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              EShimmerEffects(width: 55, height: 55, radius: 55),
              SizedBox(height: ESizes.spaceBtwItems / 2),

              /// Text
              EShimmerEffects(width: 55, height: 8),
            ],
          );
        }
      ),
    );
  }
}
