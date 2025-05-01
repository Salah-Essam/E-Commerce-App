import 'package:e_commerce/models/ProductInBag.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/userData.dart';
import 'package:e_commerce/services/FireStor_Services.dart';
import 'package:e_commerce/utilities/ApiPaths.dart';

abstract class Database {
  Future<void> setProduct(Product product);
  Stream<List<Product>> productsStream();
  Future<Product?> getProductById(String productId);
  Future<void> setUserData(UserData userData);
  Future<void> setFavoriteProduct(String productId);
  Future<void> deleteFavoriteProduct(String productId);
  Stream<Set<String>> favoriteProductsStream();
  Future<void> setProductInBag(ProductInBag productInBag);
  Future<void> deleteProductInBag(String productId);
  Stream<List<ProductInBag>> productInBagStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestorServices.instance;
  FirestoreDatabase({required this.uid});

  @override
  Future<Product?> getProductById(String productId) async {
    final product = await _service.getDocument(
      path: "${Apipaths.products()}$productId",
    );
    return product != null ? Product.fromMap(product, productId) : null;
  }

  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
    path: Apipaths.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );

  @override
  Future<void> setProduct(Product product) async {
    await _service.setData(
      path: "${Apipaths.products()}${product.id}",
      data: product.toMap(),
    );
  }

  @override
  Future<void> setUserData(UserData userData) async {
    await _service.setData(
      path: Apipaths.users(userData.id),
      data: userData.toMap(),
    );
  }

  @override
  Future<void> setFavoriteProduct(String productId) async {
    await _service.setData(
      path: Apipaths.setfavoriteProducts(productId),
      data: {},
    );
  }

  @override
  Future<void> deleteFavoriteProduct(String productId) async {
    await _service.deleteData(path: Apipaths.setfavoriteProducts(productId));
  }

  @override
  Stream<Set<String>> favoriteProductsStream() => _service
      .collectionsStream(
        path: Apipaths.favoriteProducts(),
        builder: (data, documentId) => documentId,
      )
      .map((list) => list.whereType<String>().toSet());

  @override
  Future<void> setProductInBag(ProductInBag productInBag) async =>
      await _service.setData(
        path: Apipaths.setProductInBag(productInBag.id),
        data: productInBag.toMap(),
      );

  @override
  Future<void> deleteProductInBag(String productId) async =>
      await _service.deleteData(path: Apipaths.setProductInBag(productId));

  @override
  Stream<List<ProductInBag>> productInBagStream() => _service.collectionsStream(
    path: Apipaths.productInBag(),
    builder: (data, documentId) => ProductInBag.fromMap(data!, documentId),
  );
}
