import 'dart:async';

import 'package:dr_ali_shariati_application/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(new Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Theme.of(context).accentColor,
                Theme.of(context).secondaryHeaderColor,
                Theme.of(context).primaryColor
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              stops: [0.0, 0.35, 1.0])),
      child: new Image.asset(
        'images/splash.jpg',
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: new Container(
    //     decoration: new BoxDecoration(
    //         gradient: new LinearGradient(
    //             colors: [
    //               Theme.of(context).accentColor,
    //               Theme.of(context).secondaryHeaderColor,
    //               Theme.of(context).primaryColor
    //             ],
    //             begin: Alignment.topRight,
    //             end: Alignment.bottomRight,
    //             stops: [0.0, 0.35, 1.0])),
    //     child: new Image(
    //       width: ScreenUtil().setWidth(1500),
    //       height: ScreenUtil().setHeight(1000),
    //       image: new AssetImage(
    //         'assets/images/cm.png',
    //       ),
    //     ),
    //   ),
    // );
  }
}
