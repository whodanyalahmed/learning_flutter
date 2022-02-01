import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red500.make(),
            ElevatedButton(
              onPressed: () {
                // add log add to cart
                log("add to cart");
              },
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.cyan.shade900),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add to cart".text.bold.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        title: Text(catalog.name),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: Colors.white,
                  width: context.percentWidth * 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      catalog.name.text.xl4
                          .color(Colors.cyan.shade900)
                          .bold
                          .make()
                          .px16(),
                      catalog.desc.text
                          .textStyle(const TextStyle(color: Color(0xFF8A8A8A)))
                          .xl
                          .make()
                          .px16(),
                      10.heightBox,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                          .text
                          .textStyle(const TextStyle(color: Color(0xFF8A8A8A)))
                          .make()
                          .p16()
                    ],
                  ).py64().centered(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
