import 'dart:convert';

List<ShoesCatalogue2> shoesCatalogue2FromJson(String str) =>
    List<ShoesCatalogue2>.from(
        json.decode(str).map((x) => ShoesCatalogue2.fromJson(x)));

String shoesCatalogue2ToJson(List<ShoesCatalogue2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoesCatalogue2 {
  String title;
  String description;
  String imgUrl;
  String price;
  String brand;
  String id;

  ShoesCatalogue2({
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.brand,
    required this.id,
  });

  factory ShoesCatalogue2.fromJson(Map<String, dynamic> json) =>
      ShoesCatalogue2(
        title: json["title"],
        description: json["description"],
        imgUrl: json["img_url"],
        price: json["price"],
        brand: json["brand"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "img_url": imgUrl,
        "price": price,
        "brand": brand,
        "id": id,
      };
}
