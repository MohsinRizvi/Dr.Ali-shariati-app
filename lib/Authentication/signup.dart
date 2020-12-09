import 'package:dr_ali_shariati_application/Screens/loading.dart';
import 'package:dr_ali_shariati_application/User/firebase.dart';
import 'package:dr_ali_shariati_application/admin/dashboardadmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool passwordVisible;
  bool loading = false;
  void initState() {
    passwordVisible = true;
  }

  bool _isInAsyncCall = false;
  String _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
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

  // Future<bool> _onBackPressed() {
  //   Ads.showBannerAd();
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : ModalProgressHUD(
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40),
                                  Text(
                                    "Create Account",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Image.asset(
                                    'images/logo.png',
                                    height: 50,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: name,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.0),
                                            width: 2.0),
                                      ),
                                      labelText: 'Name',
                                      hintText: "Name",
                                      icon: Icon(Icons.supervisor_account),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Required';
                                    } else
                                      return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                                        return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: number,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.0),
                                            width: 2.0),
                                      ),
                                      labelText: 'Number',
                                      hintText: "0300-0000000",
                                      icon: Icon(Icons.phone),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The Number field cannot be empty";
                                    }
                                    return "REQUIRED";
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                                      return "The password field cannot be empty";
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

                        ///confirm password
                        // ///
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: confirmpassword,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.0),
                                            width: 2.0),
                                      ),
                                      labelText: 'Confirm Password',
                                      hintText: "Confirm Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (password != confirmpassword) {
                                      return "Password does not match";
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
                        SizedBox(height: 10),
                        Container(
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 70),
                            onPressed: () async {
                              // if (formKey.currentState.validate()) {
                              Firebase.initializeApp();

                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                User updateUser =
                                    FirebaseAuth.instance.currentUser;
                                updateUser.updateProfile(
                                  displayName: name.text,
                                );
                                updateUser.updateProfile(
                                  displayName: number.text,
                                );

                                userSetup(name.text, number.text);
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: dashboard(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  dialogue(
                                      'The password provided is too weak.');
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  dialogue(
                                      'The account already exists for that email.');
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            // },
                            color: Colors.teal[300],
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 50.0),
                        // RaisedButton(
                        //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 70),
                        //   onPressed: () {
                        //     setState(() {
                        //       if (formKey.currentState.validate()) {
                        //         Navigator.push(
                        //           context,
                        //           PageTransition(
                        //             type: PageTransitionType.rightToLeftWithFade,
                        //             child: dashboard(),
                        //           ),
                        //         );
                        //       }
                        //     });
                        //   },
                        //   color: Colors.teal[300],
                        //   elevation: 11,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(40))),
                        //   child: Text(
                        //     'Sign Up',
                        //     style: TextStyle(fontSize: 20, color: Colors.white),
                        //   ),
                        // ),
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
