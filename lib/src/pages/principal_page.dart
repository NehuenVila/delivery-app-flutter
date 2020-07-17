import 'package:flutter/material.dart';

// TabBar
import 'package:delivery_prueba1/src/utils/tabBar/MotionTabController.dart';
import 'package:delivery_prueba1/src/utils/tabBar/MotionTabBarView.dart';
import 'package:delivery_prueba1/src/utils/tabBar/motiontabbar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// Dir
import 'package:delivery_prueba1/src/pages/user_profile_page.dart';


class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> with TickerProviderStateMixin {
  MotionTabController _tabController;
  @override
  void initState() {
  super.initState();
  _tabController = new MotionTabController(initialIndex:1,vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        labels: ["Inicio", "¿¿??", "Usuario",],
        initialSelectedTab: "Inicio",
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue,
        onTabItemSelected: (int value){
          print(value);
          setState(() {
            _tabController.index = value;
          });
        },
        icons: [
          LineAwesomeIcons.home, LineAwesomeIcons.hamburger, LineAwesomeIcons.user_circle,
        ],
        textStyle: TextStyle(color: Colors.blue),
      ),
      body: MotionTabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Center(
              child: Text('Home')
            ),
          ),
          Container(
            child: Center(
              child: Text('Pedidos'),
            ),
          ),
          ProfileScreen(),
        ],
      ),
    );
  }
}
