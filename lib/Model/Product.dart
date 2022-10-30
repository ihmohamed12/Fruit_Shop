import 'dart:convert';


List<Product> postFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String postToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Product {
  String name;
  String type;
  double price;
  String description;
  String imagePath;
  int calories;
  int weight;
  double rating;
  int weightBought;

  Product(
      {required this.name,
      required this.type,
      required this.price,
      required this.description,
      required this.imagePath,
      required this.calories,
      required this.weight,
      required this.rating,
      required this.weightBought});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    type: json["type"],
    price: json["price"],
    description: json["description"],
    imagePath: json["imagePath"],
    calories: json["calories"],
    weight: json["weight"],
    weightBought: json["weightBought"],
    rating:  json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "price": price,
    "description": description,
    "imagePath": imagePath,
    "calories": calories,
    "weight": weight,
    "weightBought": weightBought,
    "rating":  rating,
  };

}

class pay {
  String name;
  String Image_Path;

  pay({
    required this.name,
    required this.Image_Path,
  });
}
