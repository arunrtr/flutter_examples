import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_temp/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product List1"),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previousState, currentState) {
            return currentState is HomeActionState;
          },
          buildWhen: (previousState, currentState) => true,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              case HomeLoadedSuccessState:
                final List<dynamic> products = (state as HomeLoadedSuccessState).products;
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, index) {
                      Map<String, dynamic> product = products[index];
                      return ListTile(
                        leading: Container(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              product["thumbnail"],
                              fit: BoxFit.fill,
                            )),
                        title: Text(product["title"]),
                        subtitle: Text(product["description"]),
                      );
                    });
              case HomeErrorState:
                return const Scaffold(body: Center(child: Text("Something went Wrong!")));
            }
            return SizedBox();
          },
        ));
  }
}
