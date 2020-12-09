import 'package:dr_ali_shariati_application/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dr. Ali Shariati",
          style: TextStyle(color: Colors.teal[300].withOpacity(0.6)),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text('logout'),
            onPressed: () async {
              await auth.signOut();
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: Login(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Image.asset(
                'images/logo.png',
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chat With Us'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.event_note),
              title: Text('Term And Conditions'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              // onTap: ,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.teal,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ProfileButton(Icons.person, "View profile", () {}),
                ),
                Expanded(
                  child: ProfileButton(Icons.favorite, "Favorite", () {}),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ProfileButton(Icons.perm_identity, "Biography", () {}),
                ),
                Expanded(
                  child:
                      ProfileButton(Icons.wb_incandescent, "Writings", () {}),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ProfileButton(Icons.collections, "Collections", () {}),
                ),
                Expanded(
                  child: ProfileButton(Icons.data_usage, "Speeches", () {}),
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ProfileButton extends StatelessWidget {
  final IconData icn;
  final String name;
  final Function onPress;
  ProfileButton(this.icn, this.name, this.onPress);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 20, bottom: 20),
      height: 125,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        color: Colors.white,
        onPressed: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topLeft,
                      colors: [
                        Colors.blue,
                        Color(0xff30bc68),
                      ])),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  icn,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name.toUpperCase(),
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
