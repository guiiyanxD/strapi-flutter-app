import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 180, 110, 12),
        title: SafeArea(
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 15),
                child: Text("Aplicacion de ventas"),
              ),
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1),
        child: Center(
          child: Text("Hola Mundo"),
        ),
      ),
    );
  }
}
