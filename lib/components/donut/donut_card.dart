import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/components/donut/donut_chip.dart';
import 'package:donuts_app/components/donut/donut_description_dialog.dart';
import 'package:donuts_app/components/donut/donut_price.dart';
import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_fonts.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutCard extends StatelessWidget {
  final Donut donut;
  final VoidCallback onTap;
  final VoidCallback? onAdd;

  const DonutCard({
    super.key,
    required this.donut,
    required this.onTap,
    this.onAdd,
  });

  static const EdgeInsets _horizontalPadding = EdgeInsets.symmetric(
    horizontal: AppDimens.spaceM,
  );

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppDimens.radiusCard);

    return Material(
      elevation: AppDimens.elevation,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Picture(url: donut.picture),
            Padding(
              padding: _horizontalPadding,
              child: Row(
                children: [
                  DonutChip(
                    label: donut.isFilled
                        ? AppStrings.filled
                        : AppStrings.notFilled,
                    active: donut.isFilled,
                    activeColor: AppColors.pink,
                  ),
                  const SizedBox(width: AppDimens.spaceS),
                  DonutChip(
                    label: donut.isGlazed
                        ? AppStrings.glazed
                        : AppStrings.notGlazed,
                    active: donut.isGlazed,
                    activeColor: AppColors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimens.spaceM),
            Padding(
              padding: _horizontalPadding,
              child: Text(
                donut.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.5,
                  fontFamily: AppFonts.poiretOne,
                ),
              ),
            ),
            InkWell(
              onTap: () => showDonutDescriptionDialog(context, donut),
              child: Padding(
                padding: _horizontalPadding,
                child: Text(
                  donut.description,
                  maxLines: AppDimens.descriptionMaxLines,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    fontFamily: AppFonts.roboto,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spaceS),
            Padding(
              padding: _horizontalPadding,
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: DonutPrice(
                        price: donut.price,
                        discount: donut.discount,
                        fontFamily: AppFonts.roboto,
                        direction: Axis.horizontal,
                        alignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                  _AddButton(onPressed: onAdd ?? () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Picture extends StatelessWidget {
  final String url;

  const _Picture({required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: AppDimens.imageHeightFactor,
          child: Transform.translate(
            offset: const Offset(0, AppDimens.imageOffsetY),
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tight(
        const Size.square(AppDimens.addButtonSize),
      ),
      iconSize: AppDimens.addButtonIconSize,
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
      ),
      icon: const Icon(CupertinoIcons.add),
    );
  }
}
