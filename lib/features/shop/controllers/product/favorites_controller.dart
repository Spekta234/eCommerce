import 'dart:convert';

import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/loaders/loaders.dart';
import 'package:spekta_store/data/repositories/product/product_repository.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/utils/local_storage/storage_utility.dart';

class FavoritesController extends GetxController{
  static FavoritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }


  // Method to initialize favourites by reading from storage
  void initFavorites() {
   final json = ELocalStorage.instance().readData('favorites');
   if (json !=null) {
     final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
     favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
   }
  }

  bool isFavorites(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      ELoaders.customToast(message: 'Product has been added to the wishlist.');
    } else {
      ELocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      ELoaders.customToast(message: 'Product has been removed from the wishlist');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = jsonEncode(favorites);
    ELocalStorage.instance().saveData('favourites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProduct() async {
    return await ProductRepository.instance.getFavoriteProduct(favorites.keys.toList());
  }


}