import 'package:get/get.dart';
import 'package:spekta_store/common/widgets.login_signup/loaders/loaders.dart';
import 'package:spekta_store/data/repositories/categories/category_repository.dart';
import 'package:spekta_store/features/shop/models/category_model.dart';

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

  /// Get Category or Sub-Category Products.
}