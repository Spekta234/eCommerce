import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/loaders/loaders.dart';
import 'package:spekta_store/data/repositories/categories/category_repository.dart';
import 'package:spekta_store/data/repositories/product/product_repository.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load Category data
  Future<void> fetchCategories() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featureCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  ///  -- Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// Get Category or Sub-Category Products.
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      // fetch listed (4) products against each subCategory;
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

}