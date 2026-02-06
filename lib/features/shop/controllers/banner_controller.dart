import 'package:get/get.dart';

import '../../../common/widgets.login_signup/loaders/loaders.dart';

class BannerController extends GetxController {

  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;


    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}