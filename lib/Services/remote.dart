import 'package:http/http.dart' as http;

import '../Model/Product.dart';

class RemoteService {
  Future<List<Product>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://my-json-server.typicode.com/ihmohamed12/Fruit_Shop/Product');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
