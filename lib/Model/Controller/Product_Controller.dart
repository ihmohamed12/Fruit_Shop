import 'package:get/get.dart';

import '../../Views/Screens/User_page.dart';
import '../Product.dart';

class ProductController extends GetxController {
  var weight = 0.obs;
  int i =0;
  List<Product> item = [];
  List<Product> bought = [];
  Product bestRated = Product(
      name: '',
      type: '',
      price: 0,
      description: '',
      imagePath: '',
      calories: 0,
      weight: 0,
      rating: 0,
      weightBought: 1);
  Product current = Product(
      weight: 0,
      imagePath: "",
      description: "",
      calories: 0,
      price: 0,
      type: "",
      name: "",
      rating: 0,
      weightBought:1
  );
  List<bool> flag = [true, true, true, true, true].obs;
  var gridItems = [].obs;

  getCurrent() {
    return current;
  }

  weightADD() {
    current.weightBought++;
    update();
  }

  weightSUB() {
    current.weightBought--;
    update();  }

  getWeight() {
    return weight;
  }

  setList() {
    item.add(Product(
        name: 'Strawbereis',
        type: 'Fruit',
        price: 8.60,
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
        imagePath: 'assets/images/Fruit.png',
        calories: 33,
        weight: 4,
        rating: 4.5,
      weightBought: 1
    ));
    item.add(Product(
        name: 'Tomatoe',
        type: 'Veget',
        price: 8.60,
        description:
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
        imagePath: 'assets/images/Veget.png',
        calories: 33,
        weight: 6,
        rating: 4,
        weightBought: 1
    ));
    item.add(Product(
        name: 'Spice',
        type: 'Spice',
        price: 3.50,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non imperdiet diam, eget euismod sapien. Sed interdum tortor vel neque ullamcorper vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent vestibulum felis nunc. Donec vehicula metus in imperdiet commodo. Nam quam mauris, bibendum at.',
        imagePath: 'assets/images/spieces.png',
        calories: 83,
        weight: 9,
        rating: 3,
        weightBought: 1));
    item.add(Product(
        name: 'Orange',
        type: 'Fruit',
        price: 3.70,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut est arcu. Curabitur pellentesque iaculis felis quis elementum. Vivamus condimentum nisi vel dolor sollicitudin sodales. Curabitur eu ex sagittis, tincidunt erat sit amet, commodo arcu. Mauris et posuere metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac.',
        imagePath: 'assets/images/orange.png',
        calories: 23,
        weight: 3,
        rating: 4.9,
        weightBought: 1));
    item.add(Product(
        name: 'pomegranate',
        type: 'Fruit',
        price: 50,
        calories: 233,
        description:
            'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        imagePath: 'assets/images/pomegranate .png',
        weight: 10,
        rating: 5,
        weightBought: 1));

    for (int i = 0; i < item.length; i++) {
      if (item[i].rating > bestRated.rating) {
        bestRated = item[i];
      }
    }
    setCurrentProduct(bestRated);
    return item;
  }

  getType(int i) {
    gridItems = List.from(items).obs;
    for (int j = 0; j < flag.length; j++) {
      if (i == j) {
        flag[j] = !flag[j];
      } else {
        flag[j] = true;
      }
    }
    if (!flag[i]) {
      for (int j = 0; j < gridItems.length; j++) {
        if (gridItems[j].type != items[i].type) {
          gridItems.remove(gridItems[j]);
          j--;
        }
      }
    } else {
      gridItems = List.from(items).obs;
    }
    update();
  }

  setCurrentProduct(Product currentProduct) {
    current = Product(
        rating: currentProduct.rating,
        name: currentProduct.name,
        type: currentProduct.type,
        price: currentProduct.price,
        calories: currentProduct.calories,
        description: currentProduct.description,
        imagePath: currentProduct.imagePath,
        weight: currentProduct.weight,
        weightBought: currentProduct.weightBought
    );
  }

  removeBrought(int i) {
    bought.remove(bought[i]);
    update();

  }
  clearBrought() {
    bought.clear();
    update();  }

}
