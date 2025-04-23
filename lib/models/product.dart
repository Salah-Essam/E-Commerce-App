// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/utilities/images.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final int price;
  final String ImageUrl;
  final int? discountValue;
  final double? rate;
  final bool New;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.ImageUrl,
    this.discountValue,
    this.rate,
    required this.New,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'ImageUrl': ImageUrl,
      'discountValue': discountValue,
      'rate': rate,
      'New': New,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
      price: map['price'] as int,
      ImageUrl: map['ImageUrl'] as String,
      discountValue:
          map['discountValue'] != null ? map['discountValue'] as int : null,
      rate: map['rate'] != null ? map['rate'] as double : null,
      New: map['New'] as bool,
    );
  }
}

List<Product> dumyProduct = [
  Product(
    id: "1",
    title: "Loose Fit Washed",
    category: "T-shirt",
    price: 1099,
    ImageUrl: AppImages.ListItem1,
    discountValue: 20,
    New: true,
  ),
  Product(
    id: "2",
    title: "Slim Fit Cargo",
    category: "Joggers",
    price: 2799,
    ImageUrl: AppImages.ListItem2,
    New: true,
  ),
  Product(
    id: "3",
    title: "Loose Fit Washed",
    category: "T-shirt",
    price: 1099,
    ImageUrl: AppImages.ListItem3,
    discountValue: 25,
    New: false,
  ),
  Product(
    id: "1",
    title: "Loose Fit Washed",
    category: "T-shirt",
    price: 1099,
    ImageUrl: AppImages.ListItem1,
    New: true,
  ),
  Product(
    id: "2",
    title: "Slim Fit Cargo",
    category: "Joggers",
    price: 2799,
    ImageUrl: AppImages.ListItem2,
    discountValue: 25,
    New: false,
  ),
  Product(
    id: "3",
    title: "Loose Fit Washed",
    category: "T-shirt",
    price: 1099,
    ImageUrl: AppImages.ListItem3,
    New: false,
  ),
];
