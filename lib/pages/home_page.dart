import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widget/drawer.dart';
import 'package:flutter_application_3/widget/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    initState() {
    super.initState();
    loadJsonData();
  }

  loadJsonData() async {
    // wait for 2 secoond
    await Future.delayed(Duration(seconds: 2));
    var jsonString = await rootBundle.loadString("assets/files/catalog.json");
    var jsonData = jsonDecode(jsonString);
    var productData = jsonData["products"];
    CatalogModel.items = List.from(productData).map((data) => Item.fromJson(data)).toList();
    setState(() {});
    // print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ) : 
        Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
