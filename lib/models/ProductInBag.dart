class ProductInBag {
  final String id;
  final String size;
  final String color;
  final String title;
  final int price;
  final String imageUrl;
  final int? discountValue;
  final int quantity;
  ProductInBag({
    required this.id,
    required this.size,
    required this.color,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.discountValue,
    this.quantity = 1,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "title": title,
      "price": price,
      "ImageUrl": imageUrl,
      "discountValue": discountValue,
      "quantity": quantity,
      "size": size,
      "color": color,
    };
  }

  factory ProductInBag.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductInBag(
      id: map["id"] as String,
      title: map["title"] as String,
      price: map["price"] as int,
      imageUrl: map["ImageUrl"] as String,
      discountValue:
          map["discountValue"] != null ? map["discountValue"] as int : null,
      quantity: map["quantity"] as int,
      size: map["size"] as String,
      color: map["color"] as String,
    );
  }
}
