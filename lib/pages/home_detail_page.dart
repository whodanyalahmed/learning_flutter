import 'dart:developer';

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
              child: "Buy".text.bold.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        title: Text(catalog.name),
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
                            .make(),
                        catalog.desc.text
                            .textStyle(
                                const TextStyle(color: Color(0xFF8A8A8A)))
                            .xl
                            .make(),
                        10.heightBox,
                      ],
                    ).py64().centered()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
