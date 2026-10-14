import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_strings.dart';

abstract final class Validators {
  static final RegExp _email = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  static final RegExp upperCase = RegExp(r'[A-Z]');
  static final RegExp lowerCase = RegExp(r'[a-z]');
  static final RegExp digit = RegExp(r'[0-9]');
  static final RegExp specialChar = RegExp(
    r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])',
  );
  static final RegExp _strongPassword = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$',
  );

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredField;
    }
    return null;
  }

  static String? email(String? value) {
    return required(value) ??
        (_email.hasMatch(value!) ? null : AppStrings.invalidEmail);
  }

  static String? password(String? value) {
    return required(value) ??
        (_strongPassword.hasMatch(value!) ? null : AppStrings.invalidPassword);
  }

  static String? name(String? value) {
    return required(value) ??
        (value!.length > AppDimens.maxNameLength
            ? AppStrings.nameTooLong
            : null);
  }
}
