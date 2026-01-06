import 'package:flutter/material.dart';
import 'package:spekta_store/common/widgets.login_signup/appbar/appbar.dart';
import 'package:spekta_store/features/shop/screens/order/widgets/order_list.dart';

import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: EAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),

        /// -- Orders
        child: EOrderListItems(),
      ),
    );
  }
}
