import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spekta_store/common/styles/spacing_styles.dart';
import 'package:spekta_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:spekta_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:spekta_store/utils/constants/text_strings.dart';

import '../../../../common/widgets.login_signup/form_divider.dart';
import '../../../../common/widgets.login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo Title and subtitle
              const ELoginHeader(),

              /// Form
              const ELoginForm(),

              /// Divider
              EFormDivider(dividerText: ETexts.signInWith.capitalize!),
              const SizedBox(height: ESizes.spaceBtwSections,),

              ///  Footer
              const ESocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}






