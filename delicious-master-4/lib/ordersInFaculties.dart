import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class OrdersFaculties extends StatefulWidget {
  String canteenName;
  OrdersFaculties(this.canteenName);
  @override
  _OrdersFacultiesState createState() => _OrdersFacultiesState(canteenName);
}

class _OrdersFacultiesState extends State<OrdersFaculties> {
  String canteenName;
  _OrdersFacultiesState(this.canteenName);
  DatabaseReference refDatabase = FirebaseDatabase.instance.reference();
  Map faculties={};
  List facultyKeys = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refDatabase.child('reports').child(canteenName).once().then((value) {
      print(value.value);
      Map data = value.value;
      data.forEach((key, value) {
        refDatabase.child('users').child(key).once().then((value) {
          Map data1 = value.value;
          print(value.value);
          if(!faculties.containsKey(data1['department'])) {
            print(data1['department']);
            setState(() {
              faculties[data1['department']]= 1;
              facultyKeys.add(data1['department']);
            });
          }
          else {
            setState(() {
              faculties[data1['department']]= faculties[data1['department']]+ 1;
            });

          }
          print(faculties);
          print(facultyKeys);
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
        title: Text('Faculty Statistics'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: faculties.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(

              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(facultyKeys[index]),
                    Text('${faculties[facultyKeys[index]]}'),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}



