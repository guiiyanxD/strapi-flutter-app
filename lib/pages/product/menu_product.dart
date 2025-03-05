import 'package:app/models/product.dart';
import 'package:app/pages/product/index_product.dart';
import 'package:app/provider/product_provider.dart';
import 'package:app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
class MenuProduct extends StatefulWidget {
  const MenuProduct({super.key});

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {

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
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu de productos"),
        ),
        body: Consumer<ProductProvider>(builder: (context, value, child){
          List<Product> products = value.getProducts.sublist(value.getProducts.length-10);
          List<Product> reversed = products.reversed.toList();
          return Column(
            children: [
              Container(
                height: size.height*0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Mis Productos", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          context.push("/product/index");
                          print("HolaMundo");
                        },
                        splashColor: Colors.amber,
                        label: Text("Ver todos"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                    onRefresh: (){
                      print(products);
                      products;
                      reversed;
                      return Future.delayed(Duration(seconds: 2));
                    },
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index){
                          final product = reversed[index];
                          return CardWidget(
                            title: "${ product.name} ",
                            subtitle: "\$${product.price} ",
                            icon: Icons.arrow_forward_ios,
                            route: "/product/index",
                          );
                        }
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Agregar Producto")
                ),
              )
            ],
          );
        })
    )
    );
  }
}



/*
class MenuProduct extends StatelessWidget {
  const MenuProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Menu de productos"),
          ),
          body: Column(
            children: [
              Container(
                height: size.height*0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Mis Productos", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          context.push("/product/index");
                          print("HolaMundo");
                        },
                        splashColor: Colors.amber,
                        label: Text("Ver todos"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                    onRefresh: (){},
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return CardWidget(
                          title: "Producto $index",
                          icon: Icons.arrow_forward_ios,
                          route: "/product/index",
                        );
                      }
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Agregar Producto")
                ),
              )
            ],
          )
        )
    );
  }
}
*/