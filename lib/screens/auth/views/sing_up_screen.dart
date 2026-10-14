import 'package:donuts_app/components/my_text_field.dart';
import 'package:donuts_app/components/password_text_field.dart';
import 'package:donuts_app/components/primary_button.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/core/utils/validators.dart';
import 'package:donuts_app/screens/auth/blocs/sing_up_bloc/sign_up_bloc.dart';
import 'package:donuts_app/screens/auth/views/widgets/password_requirements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final user = MyUser(
      userId: MyUser.empty.userId,
      email: _emailController.text,
      name: _nameController.text,
      hasActiveCart: MyUser.empty.hasActiveCart,
    );
    context.read<SignUpBloc>().add(
      SignUpRequired(user, _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fieldWidth = size.width * AppDimens.formWidthFactor;

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess || state is SignUpProcess) {
          setState(() => _loading = state is SignUpProcess);
        } else if (state is SignUpFailure) {
          setState(() => _loading = false);
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
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
                  validator: Validators.email,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: fieldWidth,
                child: PasswordTextField(
                  controller: _passwordController,
                  validator: Validators.password,
                ),
              ),
              const SizedBox(height: 10),
              PasswordRequirements(controller: _passwordController),
              const SizedBox(height: 10),
              SizedBox(
                width: fieldWidth,
                child: MyTextField(
                  controller: _nameController,
                  hintText: AppStrings.name,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(CupertinoIcons.person_fill),
                  validator: Validators.name,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              if (_loading)
                const CircularProgressIndicator()
              else
                SizedBox(
                  width: size.width * AppDimens.buttonWidthFactor,
                  child: PrimaryButton(
                    label: AppStrings.signUp,
                    onPressed: _submit,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
