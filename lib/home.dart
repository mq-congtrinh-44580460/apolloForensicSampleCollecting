import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'project.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'signin.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Apollo Forensic Sample Collecting',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {
          '/login': (context) => MyLoginPage(),
          '/homepage': (context) => MyHomePage(),
          '/project': (context) => ProjectPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showProgress = false;
  final _auth = FirebaseAuth.instance;

  SharedPreferences logindata;
  String username;
  String welcomeDefault = "Welcome, user!";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(5.0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text(
                        "Welcome,",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ),
                      new Text(
                        " " + username + "!",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                    ])),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.75,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      height: 80,
                      child: RaisedButton(
                          elevation: 5.0,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProjectPage()));
                          },
                          child: Text('New Project',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 20.0))),
                    ))),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.75,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      height: 80,
                      child: RaisedButton(
                          elevation: 5.0,
                          color: Colors.white,
                          onPressed: () {},
                          child: Text('Continue Existing Project',
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0))),
                    ))),
            Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      logindata.setBool('login', true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage()));
                    },
                    child: Text('Logout'))),
          ],
        ));
  }
}
