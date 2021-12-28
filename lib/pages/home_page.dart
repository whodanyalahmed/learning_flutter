import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widget/drawer.dart';
import 'package:flutter_application_3/widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
    CatalogModel.items =
        List.from(productData).map((data) => Item.fromJson(data)).toList();
    setState(() {});
    // print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              const CatalogList().expand()
            else
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(const Color.fromARGB(255, 25, 5, 55))
            .make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(catalog.image),
        ],
      ),
    ).white.rounded.square(100).make().py16();
  }
}
