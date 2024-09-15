import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/services/get_all_product_service.dart';

void main() {
  //AllProductsService().getAllProducts;
  runApp(const storeApp());
}

class storeApp extends StatelessWidget {
  const storeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
      //home: HomePage(),
    );
  }
}
