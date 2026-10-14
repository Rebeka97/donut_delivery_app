import 'package:donuts_app/components/my_text_field.dart';
import 'package:donuts_app/components/password_text_field.dart';
import 'package:donuts_app/components/primary_button.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/core/utils/validators.dart';
import 'package:donuts_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String? _errorMsg;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
        SignInRequired(_emailController.text, _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fieldWidth = size.width * AppDimens.formWidthFactor;

    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        setState(() {
          _loading = state is SignInProcess;
          _errorMsg = state is SignInFailure
              ? AppStrings.invalidCredentials
              : null;
        });
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: AppDimens.spaceXl),
            SizedBox(
              width: fieldWidth,
              child: MyTextField(
                controller: _emailController,
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(CupertinoIcons.mail_solid),
                errorMsg: _errorMsg,
                validator: Validators.email,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: fieldWidth,
              child: PasswordTextField(
                controller: _passwordController,
                errorMsg: _errorMsg,
                validator: Validators.password,
              ),
            ),
            const SizedBox(height: AppDimens.spaceXl),
            if (_loading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: size.width * AppDimens.buttonWidthFactor,
                child: PrimaryButton(
                  label: AppStrings.signIn,
                  onPressed: _submit,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
