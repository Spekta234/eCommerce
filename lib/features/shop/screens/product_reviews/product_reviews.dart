import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:spekta_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:spekta_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/device/device_utility.dart';

import '../../../../common/widgets.login_signup/products/ratings/rating_indicator.dart';


class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: EAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from people who use the same type of device you use'),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Overall Product Ratings
              const EOverallProductRatings(),
              const ERatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}


