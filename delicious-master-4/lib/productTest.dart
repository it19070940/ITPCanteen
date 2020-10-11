import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addproduct.dart';
import 'home.dart';
import 'models/products.dart';
import 'products.dart';
import 'service/productdb.dart';

class productTest extends StatefulWidget {
  String canteenName;
  productTest(this.canteenName);
  @override
  _MenuState createState() => _MenuState(canteenName);
}

class _MenuState extends State<productTest> {
  final _store = Store();
  String canteenName;
  _MenuState(this.canteenName);
  DatabaseReference dRef = FirebaseDatabase.instance.reference();
  Map products = {};
  List productNames=[];
  @override
  void initState() {
    super.initState();
    dRef.child('products').child(canteenName).once().then((value) {
      Map val = value.value;
      setState(() {
        products =  val;

      });
      val.forEach((key, value) {
        productNames.add(key);
      });
      print(val);
      print(productNames);
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (){
        Navigator.of(context).push(new CupertinoPageRoute(
            builder: (BuildContext context) => Home(canteenName)));
      },
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: new Text('Products'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(new CupertinoPageRoute(
                    builder: (BuildContext context) => ProductAdd(canteenName)));
              },
            )
            /*IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => Mycart()));
              },
            )*/
          ],
        ),
        //body:
        //Center(
        // color: Colors.grey[200],

        // ),
        //drawer: Drawer(),*/

        body: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: products.length,
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
                            Navigator.of(context).push(new CupertinoPageRoute(
                                builder: (BuildContext context) => Products(canteenName)));
                          },
                          child: Container(
                            height: 132,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Container(
                                        // child: NetworkImage(products[index].imageLink),
                                        child: Image.network(
                                      products[productNames[index]]['imageLink'],
                                      width: 100,
                                      height: 100,
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      children: [
                                        Text('Product Name:'),
                                        new Text(
                                          productNames[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Product Price:'),
                                        new Text(
                                          '${products[productNames[index]]['price']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),

                                        //Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
                                    child: FlatButton(
                                      color: Colors.redAccent,
                                      textColor: Colors.white,
                                      disabledColor: Colors.grey,
                                      disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(3.0),
                                      splashColor: Colors.green,
                                      onPressed: () {
                                        // _store
                                        //     .deleteProduct(products[index].piID);
                                        dRef.child('products').child(canteenName).child(productNames[index]).set(null);
                                        Navigator.of(context).pushReplacement(new CupertinoPageRoute(
                                            builder: (BuildContext context) => productTest(canteenName)));
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ),
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
    );
  }
}
