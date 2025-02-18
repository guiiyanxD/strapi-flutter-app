import 'package:app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class IndexProduct extends StatefulWidget {
  const IndexProduct({super.key});

  @override
  State<IndexProduct> createState() => _IndexProductState();
}

class _IndexProductState extends State<IndexProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp){
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Productos"),
        leading: Icon(Icons.business_center),
      ),
      body: Consumer<ProductProvider>(builder: (context, value, child){
        if(value.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          final products = value.getProducts;
          return ListView.builder(
              itemCount: products.length,
              itemBuilder:(context, index){
                final product = products[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text(product.price.toString()),
                );
          });
        }
      }),
    );
  }
}
