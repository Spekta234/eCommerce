import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor = Colors.transparent,
    this.width = 56,
    this.height = 56,
    this.padding = ESizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If image background color is null switch it to light and dark mode color design.
        color:
            backgroundColor ??
            (EHelperFunctions.isDarkMode(context)
                ? EColors.black
                : EColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image:
            isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
