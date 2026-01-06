import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/custom_shapes/containers/rounded_container.dart';
import 'package:spekta_store/common/widgets.login_signup/texts/section_heading.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/constants/image_strings.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../../utils/constants/sizes.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ESectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            ERoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? EColors.light : EColors.white,
              padding: const EdgeInsets.all(ESizes.sm),
              child: const Image(image: AssetImage(EImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ],
    );
  }
}
