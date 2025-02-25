import 'package:app/pages/home_page.dart';
import 'package:app/pages/product/index_product.dart';
import 'package:app/pages/product/menu_product.dart';
import 'package:app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: '/home',
          routes: [
            GoRoute(
              path: '/productMenu',
              builder: (context, state) => const MenuProduct(),),
            GoRoute(
              path: '/SaleMenu',
              builder: (context, state) => const IndexProduct(),),
            GoRoute(
              path: '/home',
              builder: (context, state) => HomePage(),),
          ]),
        ),
      );
  }
}


