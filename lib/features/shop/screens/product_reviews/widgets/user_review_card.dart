import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/products/ratings/rating_indicator.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImages.userProfileImage3)),
                const SizedBox(width: ESizes.spaceBtwItems),
                Text('Will Smith', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const ERatingBarIndicator(rating: 4),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to investigate and make purchases seamlessly. Great Job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Company Review
        ERoundedContainer(
          backgroundColor: dark? EColors.darkerGrey : EColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ESizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Spekta Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('22 Oct, 2025', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to investigate and make purchases seamlessly. Great Job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwSections),
      ],
    );
  }
}
