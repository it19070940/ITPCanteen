import 'package:delicious/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'origin.dart';

// void main() {
//   runApp(No());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(No());
}

class No extends StatefulWidget {

  @override
  _NoState createState() => _NoState();
}

class _NoState extends State<No> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  bool alreadySigned=false;
  String canteenName='';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _pref.then((value){
      if(value.containsKey('canteen')) {
        setState(() {
          alreadySigned = true;
          canteenName = value.getString('canteen');
        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: !alreadySigned ? Promo():Home(canteenName),
    );
  }
}
