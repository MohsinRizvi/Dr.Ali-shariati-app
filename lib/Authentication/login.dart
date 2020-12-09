import 'package:dr_ali_shariati_application/Authentication/signup.dart';
import 'package:dr_ali_shariati_application/admin/dashboardadmin.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

import 'forgetpassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isInAsyncCall = false;

  void login() {
    setState(() {
      _isInAsyncCall = true;
    });
  }

  bool passwordVisible;
  void initState() {
    passwordVisible = true;
  }

  void dialogue(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(msg),
          actions: <Widget>[
            RaisedButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: Register(),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.teal[300]),
      ),
      child: Container(
        // color: Colors.transparent,
        // padding: EdgeInsets.only(bottom: 52),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: OvalBottomBorderClipper(),
                        child: Container(
                          height: 200,
                          color: Colors.teal[300],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/logo.png',
                              height: 200,
                              width: 600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: email,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 2.0),
                                ),
                                labelText: 'Email',
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please make sure your email address is valid';
                                else
                                  return "Required";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: password,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 2.0),
                                ),
                                labelText: 'Password',
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Required";
                              } else if (value.length < 6) {
                                return "6 characters at least ";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 8.0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hasFloatingPlaceholder: true,
                          suffixIcon: Icon(Icons.lock)),
                    ),
                  ),*/
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: ForgetScreen(),
                        ),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.only(top: 30, right: 16.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: Colors.teal[300],
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(height: 50.0),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 70),
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState.validate()) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text)
                              .then((result) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => dashboard()));
                          }).catchError((error) {
                            dialogue("Invalid User name or Passwword");
                          });

                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: dashboard(),
                            ),
                          );
                        }
                      });
                    },
                    color: Colors.teal[300],
                    elevation: 11,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('New User? '),
                      GestureDetector(
                        onTap: () {
                          // if (isAdShown && Ads.bannerAd != null) {
                          //   isAdShown = false;
                          //   calledDisposed = true;
                          //   Ads.bannerAd?.dispose();
                          //   //super.dispose();
                          //   Ads.bannerAd = null;
                          // }
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: Register(),
                            ),
                          ).then((value) {});
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.teal[300],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      inAsyncCall: _isInAsyncCall,
    );
  }
}
