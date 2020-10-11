import 'package:delicious/itemsSold.dart';
import 'package:delicious/ordersInFaculties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'reports.dart';



class ReportMain extends StatefulWidget {
  String canteenName;
  ReportMain(this.canteenName);
  @override
  _ReportMainState createState() => _ReportMainState(canteenName);
}

class _ReportMainState extends State<ReportMain> {
  String canteenName;
  _ReportMainState(this.canteenName);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('Reports'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Card(
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        new CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                Reports(canteenName)));
                  },
                  child: Container(
                      width: 350,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text('Disputed Orders',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        new CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                ItemsSold(canteenName)));
                  },
                  child: Container(
                      width: 350,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text('Items Sold',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        new CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                OrdersFaculties(canteenName)));
                  },
                  child: Container(
                      width: 350,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text('Orders in Faculties',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
