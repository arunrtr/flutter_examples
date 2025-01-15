import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_temp/feature/bloc_state_management/presentation/home_view_modal.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  HomeViewModal viewModal = HomeViewModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModal.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => viewModal,
        child: Consumer<HomeViewModal>(
          builder: (ctx, value, _) {
            final List<dynamic> products = value.products ?? [];
            return products.length > 0
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, index) {
                      Map<String, dynamic> product = products[index];
                      return ListTile(
                        leading: Image.network(
                          product["thumbnail"],
                          fit: BoxFit.fill,
                          width: 50,
                        ),
                        title: Text("${product["title"]}"),
                        subtitle: Text("${product["description"]}"),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
