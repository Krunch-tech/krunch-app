// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/database.dart';
import '../Models/products.dart';

class ApiCall extends ChangeNotifier {
  List<Product> products = [];
  //List<Product> products to List<String>productsString
  List<String> productsString = [];
  Rating selectedRating = Rating.none;
  final Set<String> scannedBarcodes = {};

  //check if product exists in hive box

  void addScannedBarcodes(String barcode) {
    scannedBarcodes.add(barcode);
  }

  //set selectedRating function
  void setSelectedRating(Rating rating) {
    selectedRating = rating;
    notifyListeners();
  }

  void convertString() {
    products = productsString
        .map((e) => Product.fromJson(json.decode(e), selectedRating))
        .toList();
  }

  //convert List<String> to List<Product>
  void convertList() {
    productsString = products.map((e) => e.toJson().toString()).toList();
  }

  Future<Product> getProductDetails(String barcode) async {
    const apiKey = "74ith6yamk9szlel3e56vni8hw6x45";
    final url = Uri.parse(
        'https://api.barcodelookup.com/v3/products?barcode=$barcode&formatted=y&key=$apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final productData = data['products'][0];

      Product product = Product.fromJson(productData, selectedRating);

      return product;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //get products from shared preferences

  addProduct(Product product) async {
    products.add(product);
    await Database.insert(product);
    notifyListeners();
  }

  // get products from database
  Future<void> getProductsFromDatabase() async {
    products = await Database.getFavoritesFromDatabase();
    notifyListeners();
  }
}
