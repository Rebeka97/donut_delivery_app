import 'dart:ui';

import 'package:donuts_app/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:donuts_app/screens/auth/blocs/sing_up_bloc/sign_up_bloc.dart';
import 'package:donuts_app/screens/auth/views/sign_in_screen.dart';
import 'package:donuts_app/screens/auth/views/sing_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  static const double _blurSigma = 100;
  static const double _tabPadding = 12;
  static const double _tabFontSize = 18;
  static const double _tabsHorizontalPadding = 50;

  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final userRepository = context.read<AuthenticationBloc>().userRepository;

    return Scaffold(
      backgroundColor: AppColors.welcomeBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              _Circle(
                alignment: const AlignmentDirectional(20, -1.2),
                diameter: size.width,
                color: AppColors.welcomeLargeCircle,
              ),
              _Circle(
                alignment: const AlignmentDirectional(2.7, -1.2),
                diameter: size.width / 1.3,
                color: AppColors.welcomeSmallCircle,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blurSigma,
                  sigmaY: _blurSigma,
                ),
                child: Container(),
              ),
              Align(
                child: SizedBox(
                  height: size.height / AppDimens.welcomeFormHeightDivisor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _tabsHorizontalPadding,
                        ),
                        child: TabBar(
                          controller: _tabController,
                          unselectedLabelColor: onSurface.withValues(
                            alpha: 0.5,
                          ),
                          labelColor: onSurface,
                          tabs: const [
                            _TabLabel(AppStrings.signIn),
                            _TabLabel(AppStrings.signUp),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            BlocProvider<SignInBloc>(
                              create: (_) => SignInBloc(userRepository),
                              child: const SignInScreen(),
                            ),
                            BlocProvider<SignUpBloc>(
                              create: (_) => SignUpBloc(userRepository),
                              child: const SignUpScreen(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final AlignmentGeometry alignment;
  final double diameter;
  final Color color;

  const _Circle({
    required this.alignment,
    required this.diameter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  final String label;

  const _TabLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_WelcomeScreenState._tabPadding),
      child: Text(
        label,
        style: const TextStyle(fontSize: _WelcomeScreenState._tabFontSize),
      ),
    );
  }
}
