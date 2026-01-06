import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/form_divider.dart';
import 'package:spekta_store/common/widgets.login_signup/social_buttons.dart';
import 'package:spekta_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:spekta_store/utils/constants/sizes.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(ETexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: ESizes.spaceBtwSections,),

              /// Form
              SignupForm(),
              const SizedBox(height: ESizes.spaceBtwSections,),

              /// Divider
              EFormDivider(dividerText: ETexts.orSignupWith.capitalize!),
              const SizedBox(height: ESizes.spaceBtwSections,),

              /// Social Buttons
              const ESocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}

