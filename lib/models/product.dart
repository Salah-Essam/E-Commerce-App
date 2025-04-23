class Product {
  final String id;
  final String title;
  final String category;
  final int price;
  final String ImageUrl;
  final int? discountValue;
  final int? rate;
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
      rate: map['rate'] != null ? map['rate'] as int : null,
      New: map['New'] as bool,
    );
  }
}
