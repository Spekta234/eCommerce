import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/common/widgets.login_signup/brands/brand_card.dart';
import 'package:spekta_store/common/widgets.login_signup/products/sortable/sortable_products.dart';
import 'package:spekta_store/utils/constants/sizes.dart';

class EBrandProducts extends StatelessWidget {
  const EBrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              EBrandCard(showBorder: true),
              SizedBox(height: ESizes.spaceBtwItems),

              ESortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
