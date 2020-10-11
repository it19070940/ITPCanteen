import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String carModel;
  String carColor;

  crudMethods crudObj = new crudMethods();

  Future<bool> addDialog(BuildContext context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Add data', style: TextStyle(fontSize: 15.0)),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter car name'),
                onChanged: (value){
                  this.carModel=value;
                },
              ),
              SizedBox(height:5.0),
              TextField(
                decoration: InputDecoration(hintText: 'Enter car colour'),
                onChanged: (value){
                  this.carColor=value;
                },
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pop();
                Map carData = {'carName':this.carModel, 'color':this.carColor};
                crudObj.addData(carData).then((result){
                  dialogTrigger(context);
                }

                ).catchError((e){
                  print(e);
                }

                );
              },
            )
          ],
        );
      }
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Job done', style: TextStyle(fontSize: 15.0)),
          content: Text('Added'),
          actions: <Widget>[
            FlatButton(
              child: Text('Alright'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              addDialog(context);
            },
          )
        ],
      ),
      body: Center(),
    );
  }
}