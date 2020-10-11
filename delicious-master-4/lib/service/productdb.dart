import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious/models/products.dart';


class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addproduct(Product product) {
    _firestore.collection('Products').add({
      'productName': product.pName,
      'productPrice': product.pPrice,
      'productImage': product.pImage,
    });
  }
  deleteProduct(documentId) {
    // ignore: deprecated_member_use
    Firestore.instance.collection('Products').document(documentId).delete();
  }
}
