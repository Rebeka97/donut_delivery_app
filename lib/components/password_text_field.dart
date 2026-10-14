import 'package:donuts_app/components/my_text_field.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? errorMsg;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.errorMsg,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: widget.controller,
      hintText: AppStrings.password,
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(CupertinoIcons.lock_fill),
      errorMsg: widget.errorMsg,
      validator: widget.validator,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
        ),
      ),
    );
  }
}
