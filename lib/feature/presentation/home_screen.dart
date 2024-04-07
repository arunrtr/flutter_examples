import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/feature/data/repositories/home_repository.dart';
import 'package:test_temp/feature/view_modal/home_view_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModal viewModal = HomeViewModal();

  @override
  void initState() {
    super.initState();
    viewModal.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Listing"),
      ),
      body: ChangeNotifierProvider(
        create: (_)=> viewModal,
        child: Consumer<HomeViewModal>(
          builder: (ctx, value, child) {

            if(value.products == null) {
              return Center(child: CircularProgressIndicator());
            }else if(value.products?.length == 0) {
              return const Center(child: Text("No products Found"));
            }else {
              return  ListView.builder(
                itemCount: value.products?.length,
                itemBuilder: (ctx, index) {
                  Map<String, dynamic> product = value.products?[index];
                  return ListTile(
                    leading: Image.network(
                      product["thumbnail"],
                      width: 100,
                    ),
                    title: Text(product["title"]),
                    subtitle: Text(product["description"]),
                  );
                },
              );
            }


          },
        ),
      ),
    );
  }
}
