import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/components/macro.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonutMacros extends StatelessWidget {
  final Macros macros;

  const DonutMacros({super.key, required this.macros});

  String _grams(int? value, String title) =>
      value == null ? '${AppStrings.notAvailable} $title' : '($value)g $title';

  @override
  Widget build(BuildContext context) {
    final calories = macros.calories;
    final entries = <({String label, FaIconData icon})>[
      (
        label: calories == null
            ? '${AppStrings.notAvailable} ${AppStrings.calories}'
            : '$calories ${AppStrings.calories}',
        icon: FontAwesomeIcons.fire,
      ),
      (
        label: _grams(macros.protein, AppStrings.protein),
        icon: FontAwesomeIcons.dumbbell,
      ),
      (
        label: _grams(macros.carbs, AppStrings.carbs),
        icon: FontAwesomeIcons.breadSlice,
      ),
      (
        label: _grams(macros.fat, AppStrings.fat),
        icon: FontAwesomeIcons.oilWell,
      ),
    ];

    return Row(
      children: [
        for (var i = 0; i < entries.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          MyMacroWidget(label: entries[i].label, icon: entries[i].icon),
        ],
      ],
    );
  }
}
