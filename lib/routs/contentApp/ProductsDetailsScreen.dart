import 'package:flutter/material.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/shopping_app/lib/constant/Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
   var price;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
//            Image(
//              image: NetworkImage(image),
//              fit: BoxFit.cover,
//            ),
//            CircleAvatar(
//              backgroundImage:NetworkImage(image),
//
//                radius: 50.0,
//            ),
          Text(image),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Text("Title"),
                title: Text(title),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Text("Description"),
                title: Text(description),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Text("Category"),
                title: Text(category),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Text("Price"),
                title: Text(price.toString()+"\$"),
              ),
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
          showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                    content: Text(
                      "",
                    ),
                    actions: <Widget>[
                      Row(
                        children: [
                          FlatButton(
                            child: RawMaterialButton(
                              onPressed: () {},
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              elevation: 0.0,
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              fillColor: ColorApp,
                            ),
                            onPressed: () {},
                            textColor: ColorApp,
                          ),
                          FlatButton(
                            child: RawMaterialButton(
                              onPressed: () {},
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              elevation: 0.0,
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              fillColor: ColorApp,
                            ),
                            textColor: ColorApp,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ) ??
                  false;
            },
          );
        },
      ),
    );
  }
}
