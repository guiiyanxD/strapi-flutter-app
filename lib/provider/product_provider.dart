import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier{
  final _service = ProductService();
  bool isLoading = false;
  bool hasError = false;
  List<Product> _products = [];

  List<Product> get getProducts => _products;

  Future<void> getAllProducts() async{
    isLoading = true;
    notifyListeners();

    try{
      final response = await _service.getProducts();

      _products = response;
      isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
      isLoading = false;
      hasError = true;
      notifyListeners();
      throw Exception('Error al cargar los productos');
    }
  }
}