import 'package:flutter/material.dart';

// TabBar
import 'package:delivery_prueba1/src/utils/tabBar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// Dir
import 'package:delivery_prueba1/src/pages/home_page.dart';
import 'package:delivery_prueba1/src/pages/user_profile_page.dart';


class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;

  PageController controller = PageController();

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
    double gap = 10;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.black,
      textColor: Colors.blue,
      backgroundColor: Colors.blue.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineAwesomeIcons.home,
      // textStyle: t.textStyle,
      text: 'Inicio',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.black,
      textColor: Colors.blue,
      backgroundColor: Colors.blue.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineAwesomeIcons.shopping_cart,
      // textStyle: t.textStyle,
      text: 'Pedidos',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.black,
      textColor: Colors.blue,
      backgroundColor: Colors.blue.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineAwesomeIcons.search,
      // textStyle: t.textStyle,
      text: '¡?¡?¡?',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.black,
      textColor: Colors.blue,
      backgroundColor: Colors.blue.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineAwesomeIcons.user_circle,
      // textStyle: t.textStyle,
      text: 'Usuario',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          extendBody: true,
          body: PageView(
//          physics: NeverScrollableScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                selectedIndex = page;
              });
            },
            controller: controller,
            children: <Widget>[
              HomePage(),
              Container(color: Colors.blue,),
              Container(color: Colors.red,),
              ProfileScreen()
            ],
          ),
          // backgroundColor: Colors.green,
          // body: Container(color: Colors.red,),
          bottomNavigationBar: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 10,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(1),
                        offset: Offset(0, 15))
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: GNav(
                    tabs: tabs,
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      print(index);
                      setState(() {
                        selectedIndex = index;
                      });
                      controller.jumpToPage(index);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Desea salir?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("SI"),
          ),
        ],
        elevation: 15.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    ) ??
        false;
  }


}
