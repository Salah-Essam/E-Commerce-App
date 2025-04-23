import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  String? title;
  String? category;
  String? imageUrl;
  int? price;
  int? discount;
  int? rate;
  bool? isNew;

  ProductProvider({
    this.title = "",
    this.category = "",
    this.imageUrl = "",
    this.price = 0,
    this.discount = 0,
    this.rate = 0,
    this.isNew = false,
  });

  void updateTitle(String title) => copyWith(title: title);
  void updateCategory(String category) => copyWith(category: category);
  void updateImageUrl(String imageUrl) => copyWith(imageUrl: imageUrl);
  void updatePrice(int price) => copyWith(price: price);
  void updateDiscount(int discount) => copyWith(discount: discount);
  void updateRate(int rate) => copyWith(rate: rate);
  void toggleIsNew(bool value) {
    isNew = value;
    notifyListeners();
  }

  void copyWith({
    String? title,
    String? category,
    String? imageUrl,
    int? price,
    int? discount,
    int? rate,
  }) {
    this.title = title ?? this.title;
    this.category = category ?? this.category;
    this.imageUrl = imageUrl ?? this.imageUrl;
    this.price = price ?? this.price;
    this.discount = discount ?? this.discount;
    this.rate = rate ?? this.rate;
    notifyListeners();
  }
}
