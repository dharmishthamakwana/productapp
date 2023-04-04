
import 'package:flutter/material.dart';
import 'package:productapp/screen/home/provider/Product_provider/product_provider.dart';
import 'package:productapp/screen/home/view/product_Screen.dart';
import 'package:productapp/screen/home/view/second_Screen/second_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(),
          'detail': (context) => DetailView(),
        },
        // home: HomeView(),
      ),
    ),
  );
}
