import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shopping_app/API/ProductModel.dart';

class ApiServices{
  Future<List<Product>> fetchProducts(String category) async {
    final response = await http.get('https://fakestoreapi.herokuapp.com/products/category/$category');
    if (response.statusCode == 200) {
      return parseProduct(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
  List<Product> parseProduct(String responseBody) {
    final parsed = json.decode(responseBody);
    // print("pa$parsed");
    List<Product> lst = List<Product>();
    for(int i = 0; i < parsed.length; i++) {
      lst.add(Product.fromJson(parsed[i]));
    }
    return lst;
  }

}

void main() async {
  ApiServices apiServices = ApiServices();
  List<Product> product = await apiServices.fetchProducts("jewelery");
  for(int i=0;i<product.length;i++)
    {
      print(product[i].id);
      print(product[i].title);
      print(product[i].category);
      print(product[i].description);
      print(product[i].price);
      print(product[i].image);
    }

  }




