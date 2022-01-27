import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widget/drawer.dart';
import 'package:flutter_application_3/widget/home_widgets/catalog_header.dart';
import 'package:flutter_application_3/widget/home_widgets/catalog_item.dart';
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
              const CircularProgressIndicator().centered().expand(),
          ],
        ),
      ),
    ));
  }
}


