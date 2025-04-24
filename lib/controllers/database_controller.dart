import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/FireStor_Services.dart';
import 'package:e_commerce/utilities/ApiPaths.dart';

abstract class Database {
  Future<void> setProduct(Product product);
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestorServices.instance;
  FirestoreDatabase({required this.uid});

  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
    path: Apipaths.products,
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );

  @override
  Future<void> setProduct(Product product) async {
    _service.setData(
      path: "${Apipaths.products}${product.id}",
      data: product.toMap(),
    );
  }
}
