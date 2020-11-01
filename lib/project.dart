// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:apolloForensicSampleCollection/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signin.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final _formKey00 = GlobalKey<FormState>();
  final _formKey01 = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;

  SharedPreferences logindata;
  String username;

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

  String classValue = 'Others';
  String urgentValue = 'No';
  String extStorage = 'No';
  var binaryValue = {'Yes', 'No'};

  @override
  Widget build(BuildContext context) {
    final project = FirebaseFirestore.instance.collection('project');
    return Scaffold(
        appBar: AppBar(
          title: Text('New Project'),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: _formKey01,
              child: Scrollbar(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 400),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...[
                              new Container(
                                  decoration:
                                      new BoxDecoration(color: Colors.blue),
                                  child: new ListTile(
                                      title: Text("Incident Details"))),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Address...',
                                  labelText: 'Location',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                              ),
                              Text('Classification'),
                              FutureBuilder<DocumentSnapshot>(
                                future: project.doc('classification').get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return Text("Something went wrong");
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data =
                                        snapshot.data.data();
                                    print(data.values);
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          canvasColor: Colors.lightBlue),
                                      child: DropdownButtonFormField(
                                        style: TextStyle(color: Colors.white70),
                                        value: classValue,
                                        items: data.values
                                            .map((value) => DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: value))
                                            .toList(),
                                        onChanged: (val) => setState(() {
                                          classValue = val;
                                        }),
                                      ),
                                    );
                                  }
                                  return Text("loading");
                                },
                              ),
                              Row(
                                children: <Widget>[
                                  if (classValue == 'Others')
                                    new Flexible(
                                        child: new TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Please specify...',
                                        labelText: 'Other classifications',
                                      ),
                                      onChanged: (value) {
                                        value = value;
                                      },
                                    ))
                                ],
                              ),
                              Text('Urgent?'),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(canvasColor: Colors.lightBlue),
                                child: DropdownButtonFormField(
                                  style: TextStyle(color: Colors.white70),
                                  value: urgentValue,
                                  items: binaryValue
                                      .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          value: value))
                                      .toList(),
                                  onChanged: (val) => setState(() {
                                    urgentValue = val;
                                  }),
                                ),
                              ),
                              Text('Extended Sample Storage?'),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(canvasColor: Colors.lightBlue),
                                child: DropdownButtonFormField(
                                  style: TextStyle(color: Colors.white70),
                                  value: extStorage,
                                  items: binaryValue
                                      .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          value: value))
                                      .toList(),
                                  onChanged: (val) => setState(() {
                                    extStorage = val;
                                  }),
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Checkbox(
                              //       value: brushedTeeth,
                              //       onChanged: (checked) {
                              //         setState(() {
                              //           brushedTeeth = checked;
                              //         });
                              //       },
                              //     ),
                              //     Text('Brushed Teeth',
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .subtitle1),
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Enable feature',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Switch(
                                    value: enableFeature,
                                    onChanged: (enabled) {
                                      setState(() {
                                        enableFeature = enabled;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ].expand(
                              (widget) => [
                                widget,
                                SizedBox(
                                  height: 24,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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

  Widget othersTextField = new Flexible(
      child: new TextFormField(
    decoration: InputDecoration(
      filled: true,
      hintText: 'Please specify...',
      labelText: 'Other classifications',
    ),
    onChanged: (value) {
      value = value;
    },
  ));
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        FlatButton(
          child: Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
