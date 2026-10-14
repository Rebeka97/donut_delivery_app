import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/core/utils/validators.dart';
import 'package:flutter/material.dart';

class PasswordRequirements extends StatelessWidget {
  final TextEditingController controller;

  const PasswordRequirements({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text;
        final inactive = Theme.of(context).colorScheme.onSurface;

        Widget rule(String label, bool satisfied) => Text(
          label,
          style: TextStyle(color: satisfied ? AppColors.blue : inactive),
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rule(
                  AppStrings.ruleUppercase,
                  text.contains(Validators.upperCase),
                ),
                rule(
                  AppStrings.ruleLowercase,
                  text.contains(Validators.lowerCase),
                ),
                rule(AppStrings.ruleNumber, text.contains(Validators.digit)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rule(
                  AppStrings.ruleSpecialChar,
                  text.contains(Validators.specialChar),
                ),
                rule(
                  AppStrings.ruleMinLength,
                  text.length >= AppDimens.minPasswordLength,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
