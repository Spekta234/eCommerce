import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spekta_store/utils/exceptions/firebase_exceptions.dart';
import 'package:spekta_store/utils/exceptions/format_exceptions.dart';
import 'package:spekta_store/utils/exceptions/platform_exceptions.dart';
import 'package:spekta_store/utils/models/user_model.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    // print('I,M HEREEEEEEEEEEEEEEEEE');
    try {
      await _db.collection("Users").doc("Henry").set(user.toJson());
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

  /// Function to fetch user details based on user ID.


}