import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious/models/viewOrder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  String canteenName;
  Orders(this.canteenName);

  @override
  _OrdersState createState() => _OrdersState(canteenName);
}

class _OrdersState extends State<Orders> {
  String canteenName;
  _OrdersState(this.canteenName);
  DatabaseReference refDatabase = FirebaseDatabase.instance.reference();
  Map orders = {};
  List orderIDs = [];
  @override
  void initState() {
    super.initState();

    refDatabase.child('orders').child('$canteenName').once().then((value) {
      Map data = value.value;
      print(data);
      setState(() {
        orders = data;
        orders.forEach((key, value) {
          orderIDs.add(key);
          print(key);
        });
      });
      print(orderIDs);
    });
  }

  Future<bool> addDialog(BuildContext context,Map items,index) async {
    print(items);
    var sum=0;
    List item=[];
    items.forEach((key, value) {
      item.add(key);
      Map val = value;
      print(value);
      sum= sum + value['t'];
      //print(sum);
    });
    return showDialog(
        context: context,
        //barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Order no: ${orderIDs[index]}', style: TextStyle(fontSize: 15.0)),
            content: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
// scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${item[index]} '),
                                  Text('Rs.${items[item[index]]['p']}'),
                                  Text('x ${items[item[index]]['q']}'),
                                  Text('= ${items[item[index]]['t']}'),


                                ],
                              ),
                              SizedBox(height: 5,)
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerRight,
                      child: Text("= $sum"))

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Dispatch'),
                textColor: Colors.redAccent,
                onPressed: () {
                  refDatabase.child('reports').child(canteenName).child(orderIDs[index]).set(
                    items
                  );
                  print(orderIDs);

                  refDatabase.child('orders').child(canteenName).child(orderIDs[index]).set(null);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                      new CupertinoPageRoute(
                          builder: (BuildContext context) =>
                             Orders(canteenName)));


                  //dialogTrigger(context);
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Order dispatched!', style: TextStyle(fontSize: 15.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: new Text('Orders')),
      body: Center(
        // color: Colors.grey[200],
        child: Column(
          //  mainAxisSize: MainAxisSize.max,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
// scrollDirection: Axis.horizontal,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                child: Container(
                                  height: 80,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Order ${index+1} : ${orderIDs[index]}'),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              2, 2, 15, 20),
                                          child: RaisedButton(
                                            padding: EdgeInsets.all(10),
                                            onPressed: () {
                                              addDialog(context,orders[orderIDs[index]],index);
                                              // Navigator.of(context).push(new CupertinoPageRoute(
                                              //     builder: (BuildContext context) => ViewOrder()));
                                            },
                                            child: Text("View"),
                                            color: Colors.redAccent,
                                            textColor: Colors.white,
                                            highlightColor: Colors.red,
                                          ),
                                        )
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
    );
  }
}
