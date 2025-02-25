import 'package:app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

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
                height: size.height*0.20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            width: size.width*0.40,
                            height: size.height*0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.blue,
                            ),
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text("Opciones"),
                              subtitle: Text("Subtitulo de opciones"),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ),
                          )
                      );
                    }),
              ),
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
                      child: FloatingActionButton(
                        onPressed: (){
                          //Navigator.pop(context);
                          print("HolaMundo");
                        },
                        splashColor: Colors.amber,
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        )
    );
  }
}
