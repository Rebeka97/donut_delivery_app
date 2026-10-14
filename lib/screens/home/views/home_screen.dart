import 'package:donut_repository/donut_repository.dart';
import 'package:donuts_app/components/donut/donut_card.dart';
import 'package:donuts_app/core/constants/app_assets.dart';
import 'package:donuts_app/core/constants/app_dimens.dart';
import 'package:donuts_app/core/constants/app_fonts.dart';
import 'package:donuts_app/core/constants/app_strings.dart';
import 'package:donuts_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:donuts_app/screens/home/blocs/bloc/get_donut_bloc.dart';
import 'package:donuts_app/screens/home/views/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;

    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(
        backgroundColor: surface,
        title: Row(
          children: [
            Image.asset(AppAssets.logo, scale: AppDimens.logoScale),
            const SizedBox(width: AppDimens.spaceS),
            const Text(
              AppStrings.brandName,
              style: TextStyle(
                fontFamily: AppFonts.poiretOne,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
            onPressed: () => context.read<SignInBloc>().add(SignOutRequired()),
            icon: const Icon(CupertinoIcons.arrow_right_to_line),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.spaceL),
        child: BlocBuilder<GetDonutBloc, GetDonutState>(
          builder: (context, state) => switch (state) {
            GetDonutSuccess() => _DonutGrid(donuts: state.donuts),
            GetDonutFailure() => Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Text(state.message, textAlign: TextAlign.center),
              ),
            ),
            GetDonutLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            _ => const Center(child: Text(AppStrings.genericError)),
          },
        ),
      ),
    );
  }
}

class _DonutGrid extends StatelessWidget {
  final List<Donut> donuts;

  const _DonutGrid({required this.donuts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppDimens.gridColumns,
        crossAxisSpacing: AppDimens.gridSpacing,
        mainAxisSpacing: AppDimens.gridSpacing,
        childAspectRatio: AppDimens.gridAspectRatio,
      ),
      itemCount: donuts.length,
      itemBuilder: (context, index) {
        final donut = donuts[index];
        return DonutCard(
          donut: donut,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailsScreen(donut: donut)),
          ),
        );
      },
    );
  }
}
