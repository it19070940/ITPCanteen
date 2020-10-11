import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'home.dart';

class Products extends StatefulWidget {
  String canteenName;
  Products(this.canteenName);
  @override
  _ProductsState createState() => _ProductsState(canteenName);
}

class _ProductsState extends State<Products> {
  String canteenName;
  _ProductsState(this.canteenName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) => ProductAdd(canteenName)));
            },
          )
        ],
      ),
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
                                            child: Image.asset(
                                                "images/pasta2.jpg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Name : Spicy pasta'),
                                            ),
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 37, 0.02),
                                              child: new Text('Price : 350.00'),
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

                                              Navigator.of(context).push(
                                                  new CupertinoPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          null));
                                            },
                                            child: Text("Delete"),
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
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
                                            child: Image.asset(
                                                "images/pasta2.jpg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Name : Spicy pasta'),
                                            ),
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 37, 0.02),
                                              child: new Text('Price : 350.00'),
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
                                              Navigator.of(context).push(
                                                  new CupertinoPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          null));
                                            },
                                            child: Text("Delete"),
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
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
                                            child: Image.asset(
                                                "images/pasta2.jpg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Name : Spicy pasta'),
                                            ),
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 37, 0.02),
                                              child: new Text('Price : 350.00'),
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
                                              Navigator.of(context).push(
                                                  new CupertinoPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          null));
                                            },
                                            child: Text("Delete"),
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
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
                                            child: Image.asset(
                                                "images/pasta2.jpg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Name : Spicy pasta'),
                                            ),
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 37, 0.02),
                                              child: new Text('Price : 350.00'),
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
                                              Navigator.of(context).push(
                                                  new CupertinoPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          null));
                                            },
                                            child: Text("Delete"),
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: InkWell(
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
                                            child: Image.asset(
                                                "images/pasta2.jpg"),
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 4, 10, 25),
                                              child: new Text(
                                                  'Name : Spicy pasta'),
                                            ),
                                            Padding(
                                              //padding: const EdgeInsets.only(left: 8.0),
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 37, 0.02),
                                              child: new Text('Price : 350.00'),
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
                                              Navigator.of(context).push(
                                                  new CupertinoPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          null));
                                            },
                                            child: Text("Delete"),
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
