import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:utube/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:utube/PaymentInfo.dart';
//import 'package:utube/colors.dart';
//import 'package:utube/user.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardName, cardNo, expDate, svp, bankName;

  getCardName(cardName) {
    this.cardName = cardName;
  }

  getCardNo(cardNo) {
    this.cardNo = cardNo;
  }

  getExpDate(exp) {
    this.expDate = exp;
  }

  getSvp(svp) {
    this.svp = svp;
  }

  getBankName(bankName) {
    this.bankName = bankName;
  }

  createDate() {
    DocumentReference ds = Firestore.instance.collection('Payment').document();
    Map<String, dynamic> tasks = {
      //cardnumber,expirydate,holdername,svp
      "holdername": cardName,
      "cardnumber": cardNo,
      "expirydate": expDate,
      "cardname": bankName,
      "svp": svp,
    };

    ds.setData(tasks).whenComplete(() {
      print("Details added");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, //size as parent
        // color: Colors.red,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.red[900],
          Colors.red[800],
          Colors.orange[400]
        ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //place at center

            //CrossAxisAlignment.start :place the children with their start edge aligned with the start side of cross axis

            children: <Widget>[
              //SizedBox: If given a child, this widget forces its child to have a specific width and/or height
              //If not given a child, SizedBox will try to size itself as close to the specified height and width as possible given the parent's constraints.

              SizedBox(
                height: 80,
              ),
              Padding(
                padding:
                    EdgeInsets.all(20), //space below welcome to white space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Payment",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10, //gives the gap between 2 texts
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), //gives the gap between text and white box
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                //...................
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      onChanged: (String cardName) {
                                        getCardName(cardName);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Name on card",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    )),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      onChanged: (String cardNo) {
                                        getCardNo(cardNo);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Card Number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    )),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      onChanged: (String exp) {
                                        getExpDate(exp);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Expiry Date",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ))
                              ],
                            )),
                        new SizedBox(
                          height: 25,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      onChanged: (String bankName) {
                                        getBankName(bankName);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Bank Name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    )),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      onChanged: (String svp) {
                                        getSvp(svp);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "SVP",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    )),
                              ],
                            )),
                        new SizedBox(
                          height: 25,
                        ),
                        ButtonBar(
                          mainAxisSize: MainAxisSize
                              .min, // this will take space as minimum as posible(to center)
                          children: <Widget>[
                            /*new RaisedButton(
                              color: Colors.blue,
                              child: new Text('cancel'),
                              onPressed: () => Navigator.of(context).push(
                                  new CupertinoPageRoute(
                                      builder: (BuildContext context) =>
                                          PaymentInfo())),
                            ),*/
                            new RaisedButton(
                                child: new Text('Add'),
                                onPressed: () {
                                  createDate();
                                } /*=> Navigator.of(context).push(
                                  new CupertinoPageRoute(
                                      builder: (BuildContext context) =>
                                          user())),*/

                                ),
                          ],
                        ),
                      ],
                    )),
              )))
            ]),
      ),
    );
  }

  void onpressed() {}
}