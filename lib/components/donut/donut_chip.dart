import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:flutter/material.dart';

class DonutChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color activeColor;

  const DonutChip({
    super.key,
    required this.label,
    required this.active,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.chipPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        color: active ? activeColor : AppColors.inactiveChip,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
