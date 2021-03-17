import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/Constants.dart';
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
                              onPressed: ()
                              {

                              },
                              child: Icon(FontAwesomeIcons.plus,
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
                              onPressed: ()
                              {

                              },
                              child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white,),
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
