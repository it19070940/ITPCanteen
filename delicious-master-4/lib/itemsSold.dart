import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';




class ItemsSold extends StatefulWidget {
  String canteenName;
  ItemsSold(this.canteenName);
  @override
  _ItemsSoldState createState() => _ItemsSoldState(canteenName);
}

class _ItemsSoldState extends State<ItemsSold> {
  String canteenName;
  _ItemsSoldState(this.canteenName);
  DatabaseReference refDatabase = FirebaseDatabase.instance.reference();
  Map itemsSold={};
  List itemSoldKeys = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refDatabase.child('reports').child(canteenName).once().then((value) {
      print(value.value);
      Map dispatched=value.value;
      setState(() {
        dispatched.forEach((key, value) {
          Map eachOrder=value;
          eachOrder.forEach((key, value) {
            if(!itemsSold.containsKey(key)){
              itemsSold[key]=value['q'];
            }
            else {
              itemsSold[key] = itemsSold[key] +value['q'];
            }
          });
        });
        print(itemsSold);
        itemsSold.forEach((key, value) {
          itemSoldKeys.add(key);
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('Items Sold'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: itemSoldKeys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(itemSoldKeys[index]),
                    SizedBox(width: 30,),
                    Text('${itemsSold[itemSoldKeys[index]]}'),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
