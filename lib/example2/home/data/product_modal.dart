// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

List<ProductModal> productResponseFromJson(String str) => List<ProductModal>.from(json.decode(str).map((x) => ProductModal.fromJson(x)));

String productResponseToJson(List<ProductModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModal {
  String? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;

  ProductModal({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
  };
}
