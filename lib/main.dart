import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/services/api/product_api.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductApi(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
