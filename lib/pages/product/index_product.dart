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
      bool lastTen = false;
      Provider.of<ProductProvider>(context, listen: false).getAllProducts(lastTen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Productos"),
        //leading: Icon(Icons.business_center),
      ),
      body: Consumer<ProductProvider>(builder: (context, value, child){
        if(value.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(value.hasError){
          return const Center(child: Text("Error al cargar los productos"),);
        }else{
          final products = value.getProducts;
          if(products.isNotEmpty){
            return ListView.builder(
              itemCount: products.length,
              itemBuilder:(context, index){
                final product = products[index];
                return ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toString()}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                      ],
                    )
                );
              }
            );
          }else{
            return const Center(child: Text("No existen productos"),);
          }
        }
      }),
    );
  }
}
