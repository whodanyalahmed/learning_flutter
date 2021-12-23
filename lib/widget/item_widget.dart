import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        onTap: () {
          print("${item.name} tapped!");
        },
        title: Text(item.name),
        subtitle: Text(item.desc),
        leading: CircleAvatar(
          backgroundImage: Image.network(item.image).image,
        ),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
