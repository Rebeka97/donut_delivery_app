import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_fonts.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class DonutPrice extends StatelessWidget {
  final double price;
  final double discount;
  final double currentFontSize;
  final double oldFontSize;
  final String fontFamily;
  final Color oldPriceColor;
  final CrossAxisAlignment alignment;
  final Axis direction;
  final double spacing;

  const DonutPrice({
    super.key,
    required this.price,
    required this.discount,
    this.currentFontSize = 20,
    this.oldFontSize = 16,
    this.fontFamily = AppFonts.roboto,
    this.oldPriceColor = AppColors.oldPrice,
    this.alignment = CrossAxisAlignment.end,
    this.direction = Axis.vertical,
    this.spacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discount != 0;
    final current = Text(
      AppStrings.price(hasDiscount ? price - discount : price),
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: currentFontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.pink,
      ),
    );

    if (!hasDiscount) return current;

    final old = Text(
      AppStrings.price(price),
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: oldFontSize,
        fontWeight: FontWeight.bold,
        color: oldPriceColor,
        decoration: TextDecoration.lineThrough,
      ),
    );

    final children = <Widget>[
      current,
      direction == Axis.horizontal
          ? SizedBox(width: spacing)
          : const SizedBox.shrink(),
      old,
    ];

    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: children,
    );
  }
}
