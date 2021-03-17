import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/Constants.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductsDetailsScreen(
      {@required this.image,
      @required this.title,
      @required this.description,
      @required this.category,
      @required this.price});
  final String image;
  final String title;
  final String description;
  final String category;
  final String price;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: ListView(
          children: [
            Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Text("Title"),
              title: Text(title),
            ),
            ListTile(
              leading: Text("Description"),
              title: Text(description),
            ),
            ListTile(
              leading: Text("Category"),
              title: Text(category),
            ),
            ListTile(
              leading: Text("Price"),
              title: Text(price),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        backgroundColor: ColorApp,
        onPressed: () {
          AlertDialog(
            actions: [
              Row(
                children: [


                ],
              )

            ],

          );
        },
      ),
    );
  }
}
