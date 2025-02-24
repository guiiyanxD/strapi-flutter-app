import 'package:app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 180, 110, 12),
        title: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text("Aplicacion de ventas"),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CardWidget(
              title: "Opciones de Productos",
              icon: Icons.arrow_forward_ios,
              subtitle: "Aqui puede hacer operaciones de productos",
              route: "/productMenu",
            ),
            CardWidget(
              title: "Opciones de Ventas",
              icon: Icons.arrow_forward_ios,
              subtitle: "Aqui puede hacer operaciones de ventas",
              route: "/SaleMenu",
            ),
          ],
        )
      ),
    );
  }
}
