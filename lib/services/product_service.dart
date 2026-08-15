import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(AppConstants.productsEndpoint),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Unable to load products. Status: ${response.statusCode}',
      );
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> productsJson = data['products'] ?? [];

    return productsJson
        .map((item) => Product.fromJson(item))
        .toList();
  }
}
