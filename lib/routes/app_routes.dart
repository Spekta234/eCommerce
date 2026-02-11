import 'package:get/get.dart';
import 'package:spekta_store/features/authentication/screens/login/login.dart';
import 'package:spekta_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:spekta_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:spekta_store/features/authentication/screens/signup/sigup.dart';
import 'package:spekta_store/features/authentication/screens/signup/verify_email.dart';
import 'package:spekta_store/features/personalization/screens/address/address.dart';
import 'package:spekta_store/features/personalization/screens/profile/profile.dart';
import 'package:spekta_store/features/personalization/screens/settings/settings.dart';
import 'package:spekta_store/features/shop/screens/cart/cart.dart';
import 'package:spekta_store/features/shop/screens/checkout/checkout.dart';
import 'package:spekta_store/features/shop/screens/home/home.dart';
import 'package:spekta_store/features/shop/screens/order/order.dart';
import 'package:spekta_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:spekta_store/features/shop/screens/store/store.dart';
import 'package:spekta_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:spekta_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ERoutes.home, page: () => const HomeScreen()),
    GetPage(name: ERoutes.store, page: () => const StoreScreen()),
    GetPage(name: ERoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: ERoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ERoutes.productsReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ERoutes.order, page: () => const OrderScreen()),
    GetPage(name: ERoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ERoutes.cart, page: () => const CartScreen()),
    GetPage(name: ERoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: ERoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: ERoutes.signup, page: () => SignupScreen()),
    GetPage(name: ERoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ERoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ERoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: ERoutes.onBoarding, page: () => const OnboardingScreen()),
    // Add more GetPage entries as needed
  ];
}