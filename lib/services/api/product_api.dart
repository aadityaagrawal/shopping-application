import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop/model/product_model.dart';
import 'package:http/http.dart' as http;
import '../exceptions/exception.dart';

class ProductApi extends ChangeNotifier{

  List<ProductModel> products = [];
  Set<String> categoriesSet = {"All Products"};
  List<String> categories = [];
  String baseUrl = "https://api.escuelajs.co/api/v1/";
  Future<void> fetchProductList() async {
    String apiUrl = "${baseUrl}products";

    try {
      http.Response apiResponse = await http.get(Uri.parse(apiUrl));
      if (apiResponse.statusCode == 200) {
        List<dynamic> response = jsonDecode(apiResponse.body);
        
        for (var product in response) {
          products.add(ProductModel.fromJSON(product));
        }

        for(var product in products)
        {
          categoriesSet.add(product.category.name);
        }

        categories = categoriesSet.toList();
        categories.sort();
        notifyListeners();
      } else {
        throw ParseDataException("Failed to parse the product respose");
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
