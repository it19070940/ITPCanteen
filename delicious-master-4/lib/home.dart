import 'package:delicious/generatemain.dart';
import 'package:delicious/origin.dart';
import 'package:delicious/productTest.dart';
import 'package:delicious/reportMain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'orders.dart';
import 'reports.dart';

class Home extends StatefulWidget {
  String canteenName;

  Home(this.canteenName);

  @override
  _HomeState createState() => _HomeState(canteenName);
}

class _HomeState extends State<Home> {
  String canteenName;
  _HomeState(this.canteenName);
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  bool alreadySigned;
  FirebaseMessaging _firebaseMessaging;
  @override
  void initState() {
    Firebase.initializeApp();
    _firebaseMessaging = FirebaseMessaging();
    // TODO: implement initState
    super.initState();
    print(canteenName);
    _firebaseMessaging.subscribeToTopic(canteenName);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: new Text('Delicious')),
      body: Center(
        // color: Colors.grey[200],
        child: Column(
          //  mainAxisSize: MainAxisSize.max,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
// scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Navigator.of(context).push(
                                      new CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              productTest(canteenName)));
                                },
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Container(
                                            child:
                                                Image.asset("images/logo.jpeg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Spacer(),
                                        new Text('Products'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      new CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              Orders(canteenName)));
                                },
                                splashColor: Colors.blue.withAlpha(30),
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Container(
                                            child:
                                                Image.asset("images/logo.jpeg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Spacer(),
                                        new Text('Orders'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //     new CupertinoPageRoute(
                                  //         builder: (BuildContext context) =>
                                  //             Reports(canteenName)));
                                  Navigator.of(context).push(
                                      new CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              ReportMain(canteenName)));
                                },
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Container(
                                            child:
                                                Image.asset("images/logo.jpeg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Spacer(),
                                        new Text('Reports'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  _pref.then((value) {
                                    value.remove('canteen');
                                    Navigator.of(context).push(
                                        new CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                Promo()));
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Spacer(),
                                        new Text(
                                          'Logout',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      drawer: new Drawer(
         child: new ListView(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
     children: <Widget>[
            new DrawerHeader(
                child: new Text('Header'),
                decoration: BoxDecoration(
                  color: Colors.green,
                )),     
new ListTile(
              title: new Text('Generate Qr code'),
              onTap: () => Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) =>HomePage())),
            ),
      ] ),
    
    ));
  }
}
