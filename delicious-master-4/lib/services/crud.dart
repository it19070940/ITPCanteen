
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class crudMethods{
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser!=null){
      return true;
    }
    else{
      return false;
    }
  }

  Future<void> addData(carData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('Orders').add(carData).catchError((e){
        print(e);
      }

      );
    }
    else{
      print('You need to be logged in');
    }
  }
}