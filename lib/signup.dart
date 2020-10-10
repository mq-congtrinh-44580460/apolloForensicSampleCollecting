import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apollo Forensic Sample Collecting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySignupPage(),
    );
  }
}

class MySignupPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MySignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showProgress = false;
  final _auth = FirebaseAuth.instance;
  // SharedPreferences logindata;
  // String username;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initial();
  // }
  //
  // void initial() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = logindata.getString('username');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apollo Forensic Sample Collecting'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up Page',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image.network('http://www.naturalgasasia.com/content/14941/New-South-Wales-Government-Logo1_550x300.jpg')),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Sign up'),
                      onPressed: () async {
                        setState(() {
                          showProgress = true;
                        });
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: nameController.text, password: passwordController.text);
                          print(newUser.toString());
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyLoginPage()),
                            );
                            Fluttertoast.showToast(
                                msg: "Login Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              showProgress = false;
                            });
                          }
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "Login Unsuccessfull",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginPage()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}
