import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/category_shimmer.dart';
import 'package:spekta_store/features/shop/controllers/category_controller.dart';
import 'package:spekta_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets.login_signup/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());


    return Obx(
        () {
          if (categoryController.isLoading.value) return const ECategoryShimmer();

          if (categoryController.featureCategories.isEmpty) {
            return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
          }
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featureCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category =categoryController.featureCategories[index];
                return EVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              },
            ),
          );
        }
    );
  }
}
