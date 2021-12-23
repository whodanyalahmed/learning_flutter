import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widget/drawer.dart';
import 'package:flutter_application_3/widget/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // select random item
    final dummylist = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
