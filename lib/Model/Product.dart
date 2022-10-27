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
}

class pay {
  String name;
  String Image_Path;

  pay({
    required this.name,
    required this.Image_Path,
  });
}
