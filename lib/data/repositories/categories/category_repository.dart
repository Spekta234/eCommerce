import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';
import 'package:spekta_store/utils/exceptions/firebase_exceptions.dart';
import 'package:spekta_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  
  /// Variables
  final _db = FirebaseFirestore.instance;
  
  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }  




  /// Get Sub Categories

  /// Upload Categories to the Cloud Firebase
  // Future<void> uploadDummyData(List<CategoryModel> categories) async {
  //   try{
  //     // upload all the categories along with their Images
  //
  //     // loop through each category
  //
  //   }
  // }

}