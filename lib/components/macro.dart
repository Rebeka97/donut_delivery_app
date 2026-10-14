import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String label;
  final FaIconData icon;

  const MyMacroWidget({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spaceS),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimens.radiusCard),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 5,
              color: AppColors.macroShadow,
            ),
          ],
        ),
        child: Column(
          children: [
            FaIcon(icon, color: AppColors.blue),
            const SizedBox(height: AppDimens.spaceXs),
            Text(label, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
