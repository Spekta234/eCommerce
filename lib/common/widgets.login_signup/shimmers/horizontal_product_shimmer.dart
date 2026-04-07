import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            EShimmerEffects(width: 120, height: 120),
            SizedBox(width: ESizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: ESizes.spaceBtwItems / 2),
                EShimmerEffects(width: 160, height: 15),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                EShimmerEffects(width: 110, height: 15),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                EShimmerEffects(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
