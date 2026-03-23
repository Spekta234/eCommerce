import 'package:flutter/cupertino.dart';
import 'package:spekta_store/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:spekta_store/common/widgets.login_signup/shimmers/shimmer.dart';

class EBrandShimmers extends StatelessWidget {
  const EBrandShimmers({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const EShimmerEffects(width: 300, height: 80),
    );
  }
}
