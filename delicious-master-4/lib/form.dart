// import 'package:flutter/material.dart';
// import 'package:sampleproject/models/products.dart';
// import 'package:sampleproject/service/productdb.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _name, _price, _image;
//   final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//   final _store = Store();

//   TextEditingController productcontroller = new TextEditingController();

//   TextEditingController pricecontroller = new TextEditingController();

//   TextEditingController imagecontroller = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _globalKey,
//         child: Column(children: <Widget>[
//           TextFormField(
//             controller: productcontroller,
//           ),
//           Spacer(),
//           TextFormField(
//             controller: pricecontroller,
//           ),
//           Spacer(),
//           TextFormField(
//             controller: imagecontroller,
//           ),
//           RaisedButton(onPressed: () {
//             final _name = productcontroller.text;
//             final _price = pricecontroller.text;
//             final _image = imagecontroller.text;
//             if (_globalKey.currentState.validate()) {
//               _globalKey.currentState.save();
//               _store.addproduct(
//                   Product(pImage: _name, pName: _price, pPrice: _image));
//             }
//           })
//         ]),
//       ),
//     );
//   }
// }
