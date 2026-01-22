
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spekta_store/features/authentication/screens/signup/verify_email.dart';
import 'package:spekta_store/navigation_menu.dart';
import 'package:spekta_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:spekta_store/utils/exceptions/firebase_exceptions.dart';
import 'package:spekta_store/utils/exceptions/format_exceptions.dart';
import 'package:spekta_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository  get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      // If user is logged in
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Get.offAll(() => const LoginScreen());
      // // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) // Redirect to login screen if not the first time
          : Get.offAll(const OnboardingScreen()); // Redirect to onboarding screen if it's the first time
    }

  }


/* ---------------------------------- Email & Password sign-in ---------------------------------*/

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


///  [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - Re-Authenticate user

  /// [EmailAuthentication] - FORGOT PASSWORD

/* ----------------------- Federated identity & social sign-in ---------------------------*/
  /// [GoogleAuthentication] - GOOGLE
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //
  //   } on FirebaseAuthException catch (e) {
  //     throw EFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw EFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const EFormatException();
  //   } on PlatformException catch (e) {
  //     throw EPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// [FacebookAuthentication] - FACEBOOK

/* ------------------------ ./end Federated identity & social sign-in ---------------------------*/

  /// [LogoutUser] - valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [DeleteUser] - Remove user Auth and Firestore account



}