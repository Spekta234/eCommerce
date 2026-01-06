import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ESpacingStyles{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ESizes.appBarHeight,
    left: ESizes.defaultSpace,
    bottom: ESizes.defaultSpace,
    right: ESizes.defaultSpace,
  );
}