import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestorServices {
  final _fireStor = FirebaseFirestore.instance;
  FirestorServices._();
  static final instance = FirestorServices._();

  Stream<List<String>> imagesStream({required String productId}) {
    final path = 'products/$productId/Images/images';
    final ref = _fireStor.doc(path);

    return ref.snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data == null) return [];
      return data.values.map((e) => e as String).toList();
    });
  }

  Future<Map<String, dynamic>?> getDocument({required String path}) async {
    final doc = await _fireStor.doc(path).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final referance = _fireStor.doc(path);
    debugPrint("Request Data: $data");
    await referance.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final referance = _fireStor.doc(path);
    debugPrint("path : $path");
    await referance.delete();
  }

  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final referance = _fireStor.doc(path);
    final snapshots = referance.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStor.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result =
          snapshot.docs
              .map(
                (snapshot) => builder(
                  snapshot.data() as Map<String, dynamic>?,
                  snapshot.id,
                ),
              )
              .where((value) => value != null)
              .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
