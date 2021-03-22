import 'package:flutter/material.dart';
import 'package:shopping_app/API/ApiServices.dart';
import 'package:shopping_app/API/ProductModel.dart';
import 'package:shopping_app/routs/ContentApp/ProductsDetailsScreen.dart';
import 'package:shopping_app/routs/ContentDrawerItem/AboutAppScreen.dart';
import 'package:shopping_app/routs/ContentDrawerItem/MyActivitiesScreen.dart';
import 'package:shopping_app/routs/ContentDrawerItem/MyCartScreen.dart';
import 'package:shopping_app/routs/ContentDrawerItem/MyPurchasesScreen.dart';
import 'package:shopping_app/routs/ContentDrawerItem/SettingScreen.dart';
import 'package:shopping_app/routs/formRoutes/LogInScreen.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/shopping_app/lib/constant/Constants.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  List<String> categoryType = [
    "electronics",
    "jewelery",
    "men clothing",
    "women clothing"
  ];
  Future<List<Product>> futureProduct;
  ApiServices apiServices = ApiServices();
//Type of category
  Widget contentTabs;
   int _startingTabCount = 4;


  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();
  TabController _tabController;
  @override
  void initState() {
    _tabs = getTabs(_startingTabCount);
    _tabController = getTabController();

    print("futureProduct$futureProduct");
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  Tab getTab(String text) {
    return Tab(
      child: Text(
        text,
        style: tabBarTextStyle,
      ),
    );
  }
  List<Tab> getTabs(int count) {
    _tabs.clear();
    for (int i = 0; i < count; i++) {
      _tabs.add(getTab(categoryType.elementAt(i)));
      print("categoryType.elementAt(i)"+categoryType.elementAt(i));
    }
    return _tabs;
  }
  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }

  Widget getWidget(String category) {
    return Tab(
      child: FutureBuilder<List<Product>>(
        future: apiServices.fetchProducts(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, i) {
                    contentTabs = Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Card(
                          child: Column(
                            children: [
//                                Image(
//                                    image: NetworkImage(
//                                        snapshot.data[i].image.toString())),
                              Text(snapshot.data[i].title),
                              Text(snapshot.data[i].price.toString() + " \$"),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsDetailsScreen(
                                  image: snapshot.data[i].image.toString(),
                                  title: snapshot.data[i].title,
                                  description: snapshot.data[i].description,
                                  category: snapshot.data[i].category,
                                  price: snapshot.data[i].price,
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    );

                  return contentTabs;
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator(
            backgroundColor: ColorApp,
          );
        },
      ),
    );
  }
  List<Widget> getWidgets() {
    _generalWidgets.clear();
    for (int i = 0; i < _tabs.length; i++) {
      _generalWidgets.add(getWidget(categoryType.elementAt(i)));
      print("length"+_tabs.length.toString());
    }
    return _generalWidgets;
  }



  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    var navigator = Navigator.of(context);
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
          leading: const Icon(
            Icons.shopping_cart,
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
          leading: const Icon(
            Icons.work_sharp,
            color: ColorIcons,
          ),
          onTap: () {
            navigator.pushNamed(MyPurchasesScreen.id);
          },
        ),
        ListTile(
          title: Text(
            localization.MyActivities,
            style: StyleTextWithIcon,
          ),
          leading: const Icon(
            Icons.list,
            color: ColorIcons,
          ),
          onTap: () {
            navigator.pushNamed(MyActivitiesScreen.id);
          },
        ),
        ListTile(
          title: Text(
            localization.Setting,
            style: StyleTextWithIcon,
          ),
          leading: const Icon(
            Icons.settings,
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
          leading: const Icon(
            Icons.announcement,
            color: ColorIcons,
          ),
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
      length: _startingTabCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.MainPage,
            style: AppBarStyle,
          ),
          backgroundColor: ColorApp,
          bottom: TabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: getWidgets(),
        ),
        drawer: Drawer(
          child: drawerItems,
        ),
      ),
    );
  }
}

