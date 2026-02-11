
import 'package:spekta_store/features/shop/models/banner_model.dart';
import 'package:spekta_store/routes/routes.dart';

import '../constants/image_strings.dart';

class EDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl:EImages.productBanner1, targetScreen: ERoutes.order, active: false),
    BannerModel(imageUrl: EImages.productBanner2, targetScreen: ERoutes.cart, active: true),
    BannerModel(imageUrl: EImages.productBanner3, targetScreen: ERoutes.favourites, active: true),
  ];
}
