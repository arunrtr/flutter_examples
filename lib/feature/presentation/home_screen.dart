import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/feature/data/home_repository.dart';
import 'package:test_temp/feature/view_modal/home_view_modal.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModal viewModal = HomeViewModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModal.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Listing"),),
        body: ChangeNotifierProvider<HomeViewModal>(
          create: (ctx) => viewModal,
          child: Consumer<HomeViewModal>(builder: (ctx, viewModal, child) {
            return viewModal.arrData.isNotEmpty ? ListView.builder(
                itemCount: viewModal.arrData.length,
                itemBuilder: (ctx, index) {
                  Map<String, dynamic> product = viewModal.arrData[index];
                  return ListTile(
                    leading: Image.network(product["thumbnail"], fit: BoxFit.fill, width: 100,),
                    title: Text("Index ${product["title"]}"),
                    subtitle: Text("Description ${product["description"]}"),
                  );
                }) : const Center(child: CircularProgressIndicator());

          }),
        )
    );
  }
}
