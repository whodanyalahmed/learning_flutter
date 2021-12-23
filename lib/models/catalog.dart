class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: 'Bag',
      image:
          'https://images-eu.ssl-images-amazon.com/images/I/31ch8r3QbSL._AC._SR360,460.jpg',
      price: 300,
      desc: 'A very nice Bag',
      color: '#555',
    ),
    Item(
      id: 2,
      name: 'Shoes',
      image:
          'https://img.freepik.com/free-photo/running-shoes-white-background_10541-635.jpg?size=626&ext=jpg',
      price: 150,
      desc: 'A very nice Shoes',
      color: '#555',
    ),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
