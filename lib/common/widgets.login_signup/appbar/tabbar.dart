import 'package:flutter/material.dart';
import 'package:spekta_store/utils/constants/colors.dart';
import 'package:spekta_store/utils/device/device_utility.dart';
import 'package:spekta_store/utils/helpers/helper_function.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs you have to wrap them in Material widget.
  ///  To do that we need [PreferredSized] Widget and that's why created custom class. [PreferredSizeWidget]
  const ETabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? EColors.black : EColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: EColors.primary,
        labelColor: dark ? EColors.white : EColors.primary,
        unselectedLabelColor: EColors.darkerGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
