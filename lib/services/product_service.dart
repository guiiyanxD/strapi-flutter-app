import 'package:dio/dio.dart';

import '../models/product.dart';

class ProductService{
  final Dio _dio;

  ProductService()
      : _dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:1337/api',
    headers: {'Content-Type': 'application/json'},
  ));

  /**
   * La funcion devuelve una lista de productos
   */
  Future<List<Product>> getProducts() async{
    try{
      final response = await _dio.get('/products');
      final List<dynamic> data = response.data['data'];
      return data.map((product) => Product.fromJson(product)).toList();
    }catch(e){
      throw 'Failed loading products: ${e.toString()}';
    }
  }

  Future<Product> getProduct(String id) async {
    try{
      final response = await _dio.get('/products/$id');
      final data = response.data;
      return Product.fromJson(data['data']);
    }catch(e){
      throw 'Something went wrong getting the Product: ${e.toString()}';
    }
  }

  Future<Product> createProduct(Product product)async{
    try{
      final response = await _dio.post('/product', data: {
        'data' : {
          'name' : product.name,
          'description' : product.description,
          'price' : product.price,
        }
      });
      return Product.fromJson(response.data['data']);
    }catch(e){
      throw 'Something went wrong at creating Product ${e.toString()}';
    }
  }

  Future<Product> updateProduct(Product product, String id) async {
    try{
      print(id);
      final response = await _dio.put('/products/$id', data:{
        'data':{
          'name' : product.name,
          'description' : product.description,
          'price' : product.price,
        }
      });
      return Product.fromJson(response.data['data']);
    }catch(e){
      throw 'Something went wrong updating the Product: ${e.toString()}';
    }
  }

  Future<void> deleteProduct(String id) async{
    try{
      final response = await _dio.delete('/products/$id');
      final statusCode = response.statusCode;
      if(statusCode == 200){
       print('Product deleted successfully');
      }
    }catch(e){
      throw 'Something went wrong deleting the Product: ${e.toString()}';
    }
  }
}
