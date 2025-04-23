// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/FireStor_Services.dart';

abstract class Database {
  Future<void> addProduct(Map<String, dynamic> data);
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestorServices.instatnce;
  FirestoreDatabase({required this.uid});

  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
    path: 'products/',
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );

  @override
  Future<void> addProduct(Map<String, dynamic> data) async {
    await _service.addData(path: '/products', data: data);
  }
}
