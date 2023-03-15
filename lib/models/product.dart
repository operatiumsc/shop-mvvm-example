class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite,
  });

  String? id;
  String? title;
  String? description;
  double? price;
  String? imageUrl;
  bool? isFavorite;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
        isFavorite: json["isFavorite"],
      );
}
