import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_temp/feature/data/repositories/home_repository.dart';
import 'package:test_temp/feature/presentation/home_bloc/home_bloc.dart';

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
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            {
              return const Center(child: CircularProgressIndicator());
            }
          case HomeLoadedSuccessState:
            {
              List<dynamic> products = (state as HomeLoadedSuccessState).products;
              return Scaffold(
                appBar: AppBar(
                  title: Text("Bloc Listing"),
                ),
                body: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    Map<String, dynamic> product = products[index];
                    return ListTile(
                      leading: Image.network(
                        product["thumbnail"],
                        width: 100,
                      ),
                      title: Text(product["title"]),
                      subtitle: Text(product["description"]),
                    );
                  },
                ),
              );
            }
          case HomeLoadedErrorState:
            {
              break;
            }
          default:
            SizedBox();
            break;
        }
        return SizedBox();
      },
    );
  }
}
