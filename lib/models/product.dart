// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

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

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "isFavorite": isFavorite,
    };
}
