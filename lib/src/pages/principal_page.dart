import 'package:flutter/material.dart';


class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton (
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text('Pedite Algo Brooooo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                hijo1(),
                SizedBox(width: 5),
                hijo2(),
              ],
            ),
            hijo3(),
            hijo4(),
          ],
        ),
      ),
    );
  }

  Widget hijo1() {
    return Placeholder();
  }
  Widget hijo2() {
    return Placeholder();
  }
  Widget hijo3() {
    return Placeholder();
  }
  Widget hijo4() {
    return Placeholder();
  }
}
