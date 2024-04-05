import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_temp/feature/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Demo"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => true,
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          if(state.runtimeType == HomeLoadingState) {
            return Center(child: const CircularProgressIndicator());
          }
          else if (state.runtimeType == HomeLoadedSuccessState) {
            List<dynamic> products = (state as HomeLoadedSuccessState).products;
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (ctx, index) {
                  final Map<String, dynamic> product = products[index];
                  return ListTile(
                    leading: Image.network(
                      product["thumbnail"],
                      width: 100,
                    ),
                    title: Text("${product["title"]}"),
                    subtitle: Text("${product["description"]}"),
                  );
                });
          } else if (state.runtimeType == HomeLoadedErrorState) {
            String errorMsg = (state as HomeLoadedErrorState).message;
            return Center(child: Text(errorMsg));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
