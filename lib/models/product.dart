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
