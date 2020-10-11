
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home.dart';


class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _username;
  String _password;


  void performLogin(){
    final snackbar = new SnackBar(
      content: new Text("Welcome $_username!"),
      );
      ScaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.10,
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              infoDisplayColumn(context),
              Form(
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(bottom: 30)),
                      usernameInputWidget(),
                      passwordInputWidget(),
                      //loginButton(context)
                      RaisedButton(
                        onPressed: () {
                        Navigator.of(context).push(new CupertinoPageRoute(
                              builder: (BuildContext context) => Home('Susiko')));
                             // FirebaseAuth.instance.signInWithEmailAndPassword(email: _username, password: _password);
                              // ignore: deprecated_member_use
                             /* .then((FirebaseUser user) {
                                Navigator.of(context).pushReplacementNamed('\home');
                              })
                              .catchError((e){
                                print(e);
                              });*/
                        },
                        child: Text("LOGIN"),
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        highlightColor: Colors.red,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget infoDisplayColumn(BuildContext _context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(_context).size.width * 0.25,
          MediaQuery.of(_context).size.height * 0.10, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          userImage(_context),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(_context).size.height * 0.005,
                horizontal: 20),
          ),
          Text(
            "Canteen login",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35),
          )
        ],
      ),
    );
  }

  Widget userImage(BuildContext _context) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.20,
      width: MediaQuery.of(_context).size.height * 0.20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("images/logo.jpeg"),
        ),
      ),
    );
  }

  Widget usernameInputWidget() {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        labelText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
      /*onChanged: (value){
        setState(() {
          _username = value;
        });
      },*/
      //onSaved: (val)=> _username = val,
    );
  }

  Widget passwordInputWidget() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
     /* onChanged: (value){
        setState(() {
          _password = value;
        });
      },*/
     // onSaved: (val)=> _password = val,
    );
  }

/*Widget loginButton(BuildContext _context){
  return Container(
    height: MediaQuery.of(_context).size.height*0.07,
    child: MaterialButton(
      onPressed: () {},
      child: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(244, 67, 54, 1)
        ]
      ),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}*/

}
