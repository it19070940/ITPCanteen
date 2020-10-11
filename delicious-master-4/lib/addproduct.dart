
import 'package:delicious/productTest.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddProduct  extends StatelessWidget {
  String canteenName;
  AddProduct(this.canteenName);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ProductAdd(canteenName),),);
  }
}


// ignore: must_be_immutable
class ProductAdd extends StatefulWidget {
  String canteenName;
  ProductAdd(this.canteenName);
  @override
  
  _ProductAddState createState() {
    return _ProductAddState(canteenName);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class _ProductAddState extends State<ProductAdd> {
  String canteenName;
  _ProductAddState(this.canteenName);
  DatabaseReference dRef = FirebaseDatabase.instance.reference();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  //File _image;
String name, price, link;

  getName(name){
    this.name=name;
  }

  getPrice(price){
    this.price=price;
  }

  getLink(link){
    this.link= link;
  }

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Add product'),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
            leading: IconButton(
              onPressed: (){
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => productTest(canteenName)));
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    //color: Colors.grey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter product name:'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (String name) {
                      getName(name);
                    },
                  ),
                ),
                new SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter product price',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (String price) {
                      getPrice(price);
                    },
                  ),
                ),
                new SizedBox(height: 20),
                /* Container(
                  decoration: BoxDecoration(
                   // color: Colors.grey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter product category',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),*/
                new SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter image link',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (String link) {
                      getLink(link);
                    },
                  ),
                ),


                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                       // backgroundColor: Color(0xff476cfb),
                        //child: Image.network("https://www.pinterest.com/pin/719027896750897820/",
                        //fit: BoxFit.fill,
                        //),
                        child: (_image!=null)?Image.file(_image,fit: BoxFit.fill):
                        //Image(
                          Image.network("https://www.google.com/search?q=pictures+of+food&rlz=1C1CHBD_enLK914LK914&tbm=isch&source=iu&ictx=1&fir=Bid1PReubUsI_M%252CO4Ee-dOU81wEsM%252C_&vet=1&usg=AI4_-kSzETxPQvmxZzkrJm1JWFqhCjXtww&sa=X&ved=2ahUKEwid5POnjNXrAhWh_XMBHWHACuIQ9QF6BAgKEGE#imgrc=Bid1PReubUsI_M")
                        ),
                      ),
                    //),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 50, 15, 20),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30.0,
                        ),
                        onPressed: (){
                          getImage();
                        },
                      ),
                    )
                  ],
                ),*/


                Padding(
                  padding: const EdgeInsets.fromLTRB(140, 100, 15, 46),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.

                        dRef.child('products').child(canteenName).child('$name').set(
                          {
                            'imageLink' : link,
                            'price' : price

                          }
                        );
                        Navigator.of(context).pushReplacement(new CupertinoPageRoute(
                            builder: (BuildContext context) => productTest(canteenName)));
                      }




                    },
                    child: Text('Submit'),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    highlightColor: Colors.red,


                  ),
                ),
              ],
            ),
          ),
        ),
      ),),),
    );
  }


}
