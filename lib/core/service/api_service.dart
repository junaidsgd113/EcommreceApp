import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../model/products.dart';

class ApiProductService {
  Future<List<Product>> fetchProducts() async {
    try {
      var response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        if (data.containsKey('products')) {
          var productsList = (data['products'] as List<dynamic>)
              .map((product) { 
                 var uuid=const Uuid().v1();
               return Product.fromJson(product,uuid);})
              .toList();
        
          return productsList;
        }
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> fetchSearchProducts(String query) async {
    try {
      var response = await http
          .get(Uri.parse('https://dummyjson.com/products/search?q=$query'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        if (data.containsKey('products')) {
            var uuid = const Uuid().v1();  
          var searchList = (data['products'] as List<dynamic>)
         
              .map((search) => Product.fromJson(search,uuid))
              .toList();

          return searchList;
        }
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
