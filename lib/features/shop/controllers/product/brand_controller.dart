import 'package:get/get.dart';
import 'package:spekta_store/data/repositories/product/product_repository.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import '../../../../common/widgets.login_signup/loaders/loaders.dart';
import '../../../../data/repositories/brands/brand_repository.dart';
import '../../models/brand_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try{
      // Show loader while loading Brands
      isLoading.value = true;

      // Fetch Brands
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brands) => brands.isFeatured ?? false).take(4));

    }catch (e){
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isLoading.value = false;
    }
  }

  /// -- Get Brands For Category

  /// Get Brand Specific Products From your data source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }
}