import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/features/authentication/controllers/login/login_controller.dart';
import 'package:spekta_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:spekta_store/features/authentication/screens/signup/sigup.dart';
import 'package:spekta_store/navigation_menu.dart';
import 'package:spekta_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ESizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => EValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ETexts.email,
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            /// Password
            Obx(
                  () => TextFormField(
                validator: (value) => EValidator.validateEmptyText('Password',value),
                controller: controller.password,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: ETexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () =>
                      controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                  ),
                ),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields / 2),

            /// Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Obx(() =>
                        Checkbox(value: controller.rememberMe.value,
                            onChanged: (value) =>
                            controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(ETexts.rememberMe),
                  ],
                ),

                /// Forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(ETexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(ETexts.signIn),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems),

            /// Create Account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(()=> const SignupScreen()),
                child: const Text(ETexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}