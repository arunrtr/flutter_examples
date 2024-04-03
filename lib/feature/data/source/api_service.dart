import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_temp/constants.dart';

class ApiService {
   Dio _dio = Dio();
  //
  // Future<List<Map<String,dynamic>>> fetchProducts() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   print("get data");
  //   return Constants.productData;
  // }
  Future<List<dynamic>> fetchProductsFromApi() async {
     final response = await _dio.get("https://dummyjson.com/products");
     final result = response.data;
    return result["products"];
  }
}
