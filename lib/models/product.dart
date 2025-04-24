class Product {
  final String id;
  final String title;
  final String category;
  final int price;
  final String imageUrl;
  final int? discountValue;
  final int? rate;
  final bool isNew;
  final List<String>? imageUrls;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.discountValue,
    this.rate,
    required this.isNew,
    this.imageUrls,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'ImageUrl': imageUrl,
      'discountValue': discountValue,
      'rate': rate,
      'New': isNew,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
      price: map['price'] as int,
      imageUrl: map['ImageUrl'] as String,
      discountValue:
          map['discountValue'] != null ? map['discountValue'] as int : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      isNew: map['New'] as bool,
    );
  }
}
