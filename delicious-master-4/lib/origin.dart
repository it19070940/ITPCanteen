// import 'package:ITP/addpromo.dart';
// import 'package:ITP/constant.dart';
// import 'package:ITP/models/promo.dart';
// import 'package:ITP/service/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'models/promo.dart';
import 'package:firebase_core/firebase_core.dart';


class Promo extends StatefulWidget {

  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  // final _store = Store();


  var future;
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  var canteenName='';
  @override
  void initState() {
    // TODO: implement initState
     Firebase.initializeApp().then((value) {
       setState(() {
         future= FirebaseFirestore.instance.collection('Promo').snapshots();
       });
     });


    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: new AppBar(
        title: GestureDetector(
          child: new Text("Delicious"),
        ),
        backgroundColor: Colors.redAccent[400],
        iconTheme: IconThemeData(color: Colors.grey[600]),
        centerTitle: true,
      
      ),
      body: StreamBuilder<QuerySnapshot>(
        // ignore: deprecated_member_use
        stream:future,
        builder: (context, snapshot) {
         Firebase.initializeApp();
          if (snapshot.hasData) {
            List<PromO> promo = []; // ignore: deprecated_member_use
            for (var doc in snapshot.data.docs) {
              Map<String,dynamic> data = doc.data();
              promo.add(PromO(
                piID: doc.id,
                pName: data['PromoCode'],
                pPercenatge: data['PromoPercentage'],
                pId: data['PromoId'],
                pExpire: data['PromoExpire'],
              ));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12.0),
                                          topLeft: Radius.circular(12.0))),
                                  height: 50,
                                  width: 250,
                                  child: IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.white,
                                    iconSize: 28,
                                    onPressed: () {
                                      // Provider.of<CartItem>(context,
                                      //         listen: false)
                                      //     .deleteProduct(
                                      //         products[index]);
                                      showCustomDialog(promo, context, index);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 0.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                promo[index].pName,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              promo[index].pPercenatge,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                               Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0))),
                                  height: 50,
                                  width: 250,
                                  
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(1, 1),
                                blurRadius: 4)
                          ],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                          )),
                    ),
                  ),
                ),
              ),
              itemCount: promo.length,
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    ));
  }

  void showCustomDialog(List<PromO> promo, context, int index) async {
    var mobileNo;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () async{
            if (mobileNo == promo[index].pId) {
              SharedPreferences pref = await _pref;
              _pref.then((value){
                value.setString('canteen', '${promo[index].pName}');
              });
              print("successfully");
              Navigator.of(context).push(new CupertinoPageRoute(
                              builder: (BuildContext context) => Home('${promo[index].pName}')));
            } else {
              print("unsuccessfully");
            }

            // }
          },
          child: Text('Confirm'),
        )
      ],
      content: TextField(
        onChanged: (value) {
          mobileNo = value;
        },
        decoration: InputDecoration(hintText: 'Enter your Address'),
      ),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}