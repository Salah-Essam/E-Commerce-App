import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/FireStor_Services.dart';

abstract class Database {
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestorServices.instatnce;

  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
    path: 'products/',
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );
}
