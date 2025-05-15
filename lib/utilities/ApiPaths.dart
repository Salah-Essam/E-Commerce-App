import 'package:firebase_auth/firebase_auth.dart';

class Apipaths {
  static String products() => "products/";
  static String users(String uid) => "users/$uid";
  static String userData() => "users/${FirebaseAuth.instance.currentUser!.uid}";
  static String setfavoriteProducts(String productId) =>
      "users/${FirebaseAuth.instance.currentUser!.uid}/favorites/$productId";
  static String favoriteProducts() =>
      "users/${FirebaseAuth.instance.currentUser!.uid}/favorites";
  static String setProductInBag(String productId) =>
      "users/${FirebaseAuth.instance.currentUser!.uid}/Bag/$productId";
  static String productInBag() =>
      "users/${FirebaseAuth.instance.currentUser!.uid}/Bag";
}
