import 'package:flutter/material.dart';
import 'package:shopping_app/API/ApiServices.dart';
import 'package:shopping_app/API/ProductModel.dart';
import 'package:shopping_app/Screen/ContentApp/ProductsDetailsScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/AboutAppScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyActivitiesScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyCartScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyPurchasesScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/SettingScreen.dart';
import 'package:shopping_app/Screen/FormScreens/LogInScreen.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/widgets/Constants.dart';


class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin  {
  int countOfTabs;
  AnimationController  controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {

      });
    });
    controller.repeat(reverse: true);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 apiContent() async
{
  ApiServices apiServices = ApiServices();
  List<Product> product = await apiServices.fetchProducts();
  return product;

}

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    var navigator =   Navigator.of(context);
    final drawerHeader = DrawerHeader(
      child: Center(
          child: Column(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 100.0,
          ),
          Text(
            'SHOP',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ],
      )),
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
              AssetImage("images/stains_dark_texture_129779_300x168.jpg"),
              fit: BoxFit.cover)),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,

        ListTile(
          title: Text(
               localization.MyCart,
            style: StyleTextWithIcon,
              ),
          leading: const Icon(Icons.shopping_cart,
            color: ColorIcons,
          ),
          onTap: () {
            navigator.pushNamed(MyCartScreen.id);
          },
        ),
        ListTile(
          title: Text(
               localization.MyPurchases,
            style: StyleTextWithIcon,
              ),
          leading: const Icon(Icons.work_sharp,
            color: ColorIcons,),
          onTap: () {
            navigator.pushNamed(MyPurchasesScreen.id);
          },
        ),
        ListTile(
          title: Text(
             localization.MyActivities,
            style: StyleTextWithIcon,
              ),
          leading: const Icon(Icons.list,
            color: ColorIcons,
          ),
          onTap: () {
            navigator.pushNamed(MyActivitiesScreen.id);
          },
        ),
        ListTile(
          title: Text(
            localization.Setting ,
            style: StyleTextWithIcon,
          ),
          leading: const Icon(Icons.settings,
            color: ColorIcons,
          ),
          onTap: () {
            navigator.pushNamed(SettingScreen.id);
          },
        ),
        ListTile(
          title: Text(
               localization.About,
            style: StyleTextWithIcon,
              ),
          leading: const Icon(Icons.announcement,
            color: ColorIcons,),
          onTap: () {
            navigator.pushNamed(AboutAppScreen.id);
          },
        ),

        ListTile(
          title: Text(
            localization.LogOut,
            style: StyleTextWithIcon,
          ),
          leading: const Icon(
            Icons.logout,
            color: ColorIcons,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(LogInForm.id);
          },
        ),
      ],
    );
    return DefaultTabController(
      length:4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.MainPage,
            style: AppBarStyle,
          ),
          backgroundColor: ColorApp,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                    "Electronics",
                  style: tabBarTextStyle,
                ),

              ),
              Tab(
                child: Text(
                  "Jewelery",
                  style: tabBarTextStyle,
                ),


              ),
              Tab(
                child: Text(
                  "Man clothing",
                  style: tabBarTextStyle,
                ),


              ),
              Tab(
                child: Text(
                  "Women clothing",
                  style: tabBarTextStyle,
                ),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("images/Screen.jpg")),
                                  Text("ttttt"),
                                  Text("gggggg"),
                                ],
                              ),
                            ),
                            onTap: ()
                            {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
            Tab(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            Tab(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/Screen.jpg")),
                                    Text("ttttt"),
                                    Text("gggggg"),
                                  ],
                                ),
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetailsScreen(image:"images/Screen.jpg",title:"tttt",description: "gff",category: "mmm",price: "20.0",),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            Tab(

            child:  CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
              backgroundColor: ColorApp,

            ),
              //icon: Icon(Icons.directions_transit),
            ),


          ],
        ),
        drawer: Drawer(
          child: drawerItems,
        ),
      ),
    );
  }
}
