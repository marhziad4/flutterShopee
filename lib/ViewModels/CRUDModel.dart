import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterproject/locator.dart';
import 'package:flutterproject/models/productModel.dart';
import 'package:flutterproject/services/Api.dart';

class CRUDModel extends ChangeNotifier{
Api _api = getIt<Api>();
List<Product> products;

    Future<List<Product>> fetchProducts()async{
      var results = await _api.getCollectionDocs();
      results.documents.map((doc) => Product.fromJson(doc.data, doc.documentID)).toList();
      return products;
    }

    Stream<QuerySnapshot> fetchProductAsStream(){
      _api.getCollectionDocsAsStream();
    }

    Future<Product> getProductById(String id)async{
      DocumentSnapshot documentSnapshot = await _api.getDocumentById(id);
      Product product = Product.fromJson(documentSnapshot.data, documentSnapshot.documentID);
      return product;
    }
    Future<String> addProduct(Product product)async{
      DocumentReference documentReference = await _api.addDocument(product.toJson());
      notifyListeners();
      return documentReference.documentID;
    }
    removeProduct(String id)async{
      _api.deleteDocument(id);
      notifyListeners();
    }
    updataDocument(String id , Map data){
      _api.updateDocument(id, data);
      notifyListeners();
    }
}