import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_temp/example2/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previousState, currentState) => currentState is HomeActionState,
      buildWhen: (previousState, currentState) => currentState is! HomeActionState,
      listener: (context, state) {
        if (state is HomeProductCartActionState) {
        } else if (state is HomeProductWishlistActionState) {
        } else if (state is HomeNavigateToCartActionState) {
        } else if (state is HomeNavigateToWishlistActionState) {}
      },
      builder: (context, state) {
        print("state ${state.runtimeType}");
        switch (state.runtimeType) {

        case HomeLoadingState:

            return Scaffold(
              body: Center(child: const CircularProgressIndicator()),
            );

          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Arun Grocery Shop"),
                actions: [
                  IconButton(
                      onPressed: () {
                        print("Favourite clicked");
                      },
                      icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        print("Favourite clicked");
                      },
                      icon: const Icon(Icons.shopping_basket))
                ],
              ),
            );
          case HomeErrorState:
            return const Scaffold(body: const Center(child: const Text("Error")));
          default:
            const SizedBox();
        }
        return const SizedBox();
      },
    );
  }
}
