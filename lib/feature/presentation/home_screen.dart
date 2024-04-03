import 'package:flutter/material.dart';
import 'package:test_temp/feature/data/home_repository.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);
  List<dynamic> arrData = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRepository repository = HomeRepository();
    repository.fetchProductsFromApi().then((value) {
        setState(() {
          widget.arrData = value;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listing"),),
      body: widget.arrData.length > 0 ? ListView.builder(
          itemCount: widget.arrData.length,
          itemBuilder: (ctx, index) {
            Map<String,dynamic> product = widget.arrData[index];
            return ListTile(
              leading:Image.network(product["thumbnail"], fit: BoxFit.fill, width: 100,),
              title: Text("Index ${product["title"]}"),
              subtitle: Text("Description ${product["description"]}"),
            );
          } ) : Center(child: CircularProgressIndicator()),
    );
  }
}
