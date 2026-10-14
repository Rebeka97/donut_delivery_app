import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

Future<void> showDonutDescriptionDialog(BuildContext context, Donut donut) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(donut.name),
      content: SingleChildScrollView(child: Text(donut.description)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text(AppStrings.close),
        ),
      ],
    ),
  );
}
