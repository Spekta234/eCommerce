import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/products/product_cart/product_card_vertical.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(title: Text('Popular Product'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: ESortableProducts(),
        ),
      ),
    );
  }
}

