import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('En-Cafe',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            MenuCard(
              menuName: 'Cookies',
              menuVariant: 'Chocolate',
              menuType: 'Camilan Tugas',
              rating: 4,
              menuImage: AssetImage('Assets/cookies.jpg'),
              price: 150,
            ),
            MenuCard(
              menuName: 'Mini Cake',
              menuVariant: 'with Spesial Topping',
              menuType: 'Camilan Santai',
              rating: 4,
              menuImage: AssetImage('Assets/miniCake.jpg'),
              price: 185,
            ),
            MenuCard(
              menuName: 'Waffles',
              menuVariant: 'with Ice Cream',
              menuType: 'Camilan Favorite',
              rating: 5,
              menuImage: AssetImage('Assets/waffles.jpg'),
              price: 245,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String menuName;
  final String menuVariant;
  final String menuType;
  final int rating;
  final ImageProvider menuImage;
  final double price;

  MenuCard({
    required this.menuName,
    required this.menuVariant,
    required this.menuType,
    required this.rating,
    required this.menuImage,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: menuImage,
              radius: 30.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(menuName,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Text(menuVariant, style: TextStyle(fontSize: 15.0)),
                  Text(menuType, style: TextStyle(fontSize: 12.0)),
                  Row(
                    children: List.generate(rating, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: index < rating ? Colors.amber : Colors.grey,
                      );
                    }),
                  ),
                ],
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}', // Menampilkan harga
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
