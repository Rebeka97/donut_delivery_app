import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/core/theme/app_theme.dart';
import 'package:donuts_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:donuts_app/screens/auth/views/welcome_screen.dart';
import 'package:donuts_app/screens/home/blocs/bloc/get_donut_bloc.dart';
import 'package:donuts_app/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status != AuthenticationStatus.authenticated) {
            return const WelcomeScreen();
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                  context.read<AuthenticationBloc>().userRepository,
                ),
              ),
              BlocProvider(
                create: (_) =>
                    GetDonutBloc(FirebaseDonutRepo())..add(GetDonut()),
              ),
            ],
            child: const HomeScreen(),
          );
        },
      ),
    );
  }
}
