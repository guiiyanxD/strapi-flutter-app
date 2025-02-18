import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier{
  final _service = ProductService();
  bool isLoading = false;
  List<Product> _products = [];

  List<Product> get getProducts => _products;

  Future<void> getAllProducts() async{
    isLoading = true;
    notifyListeners();

    final response = await _service.getProducts();
    print(response);
    _products = response;
    isLoading = false;
    notifyListeners();
  }
}