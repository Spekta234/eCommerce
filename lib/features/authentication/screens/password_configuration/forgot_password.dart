import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(ETexts.forgotPassword, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: ESizes.spaceBtwItems,),
            Text(ETexts.forgotPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: ESizes.spaceBtwSections * 2,),

            /// Text Field
            TextFormField(
                decoration: const InputDecoration(labelText: ETexts.email, prefixIcon: Icon(Iconsax.direct_right))
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Submit buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(ETexts.submit)))
          ],
        ),
      ),

    );
  }
}
