import 'package:donuts_app/app_view.dart';
import 'package:donuts_app/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  final UserRepository userRepository;
	const MainApp(this.userRepository,{super.key});

	@override
	Widget build(BuildContext context) {
		return RepositoryProvider<AuthenticationBloc>(
			create: (context) => AuthenticationBloc(
				userRepository: userRepository,
			),
			child: MyAppView(),
		);
	}
}

