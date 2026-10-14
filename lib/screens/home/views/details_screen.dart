import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/components/donut/donut_macros.dart';
import 'package:donuts_app/components/donut/donut_price.dart';
import 'package:donuts_app/components/primary_button.dart';
import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_fonts.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Donut donut;

  const DetailsScreen({super.key, required this.donut});

  static const List<BoxShadow> _shadow = [
    BoxShadow(color: AppColors.shadow, offset: Offset(3, 3), blurRadius: 5),
  ];

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(backgroundColor: surface),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.pagePadding),
        child: Column(
          children: [
            Container(
              width: width,
              height: width - 2 * AppDimens.pagePadding,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
                boxShadow: _shadow,
                image: DecorationImage(image: NetworkImage(donut.picture)),
              ),
            ),
            const SizedBox(height: AppDimens.spaceXxl),
            Container(
              padding: const EdgeInsets.all(AppDimens.pagePadding),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
                boxShadow: _shadow,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          donut.name,
                          style: const TextStyle(
                            fontFamily: AppFonts.poiretOne,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DonutPrice(
                            price: donut.price,
                            discount: donut.discount,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spaceM),
                  DonutMacros(macros: donut.macros),
                  const SizedBox(height: AppDimens.spaceHuge),
                  SizedBox(
                    width: width,
                    height: AppDimens.detailsButtonHeight,
                    child: PrimaryButton(
                      label: AppStrings.buyNow,
                      onPressed: () {},
                      radius: AppDimens.radiusButton,
                      fontSize: 20,
                      backgroundColor: AppColors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
