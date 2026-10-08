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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset('assets/photos/logo.png', scale: 30),
            const SizedBox(width: 8),
            const Text(
              'DONUTS',
              style: TextStyle(
                fontFamily: 'PoiretOne',
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
            icon: const Icon(CupertinoIcons.arrow_right_to_line),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetDonutBloc, GetDonutState>(
          builder: (context, state) {
            if (state is GetDonutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDonutSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: state.donuts.length,
                itemBuilder: (context, int i) {
                  state.donuts[i].description;
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              donut: state.donuts[i],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.9,
                                child: Transform.translate(
                                  offset: const Offset(0, -5),
                                  child: Image.network(
                                    state.donuts[i].picture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: state.donuts[i].isFilled
                                        ? const Color.fromARGB(
                                            255,
                                            252,
                                            109,
                                            169,
                                          )
                                        : Colors.grey.shade400,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 8.0,
                                    ),
                                    child: Text(
                                      state.donuts[i].isFilled
                                          ? 'Filled'
                                          : 'Not Filled',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: state.donuts[i].isGlazed
                                        ? const Color.fromARGB(
                                            255,
                                            75,
                                            184,
                                            227,
                                          )
                                        : Colors.grey.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 8.0,
                                    ),
                                    child: Text(
                                      state.donuts[i].isGlazed
                                          ? 'Glazed'
                                          : 'Not Glazed',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              state.donuts[i].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                                fontFamily: 'PoiretOne',
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => showDialog<void>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: Text(state.donuts[i].name),
                                content: SingleChildScrollView(
                                  child: Text(state.donuts[i].description),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Text(
                                state.donuts[i].description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (state.donuts[i].discount == 0)
                                          Text(
                                            "\$${state.donuts[i].price.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                255,
                                                252,
                                                109,
                                                169,
                                              ),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        else ...[
                                          Text(
                                            "\$${(state.donuts[i].price - state.donuts[i].discount).toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                255,
                                                252,
                                                109,
                                                169,
                                              ),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "\$${state.donuts[i].price.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade500,
                                              fontWeight: FontWeight.w700,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton.filled(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minWidth: 28,
                                    minHeight: 28,
                                    maxWidth: 28,
                                    maxHeight: 28,
                                  ),
                                  iconSize: 16,
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: const CircleBorder(),
                                  ),
                                  icon: const Icon(CupertinoIcons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetDonutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDonutFailure) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Text(state.message, textAlign: TextAlign.center),
                ),
              );
            } else {
              return const Center(child: Text('An error occurred...'));
            }
          },
        ),
      ),
    );
  }
}
