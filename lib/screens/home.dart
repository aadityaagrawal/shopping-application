import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/product_model.dart';
import 'package:shop/services/api/product_api.dart';
import '../components/app_bar.dart';
import '../components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = List.generate(6, (i) => i != 0 ? false : true);
  int selectedIndex = 0;
  List<ProductModel> categoryProduct = [];

  @override
  void initState() {
    super.initState();
    final productProvider = Provider.of<ProductApi>(context, listen: false);
    productProvider.fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductApi>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          name: 'Krishna SN',
          imageUrl:
              "https://images.unsplash.com/photo-1583864697784-a0efc8379f70?auto=format&fit=crop&q=80&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&w=3088",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                    spacing: 8,
                    children: List.generate(
                        productProvider.categories.length,
                        (index) => ChoiceChip(
                              selectedColor: Colors.black,
                              label: Text(
                                productProvider.categories.elementAt(index),
                                style: TextStyle(
                                    color: isSelected[index]
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              selected: isSelected[index],
                              onSelected: (value) {
                                setState(() {
                                  isSelected = List.generate(6, (_) => false);
                                  isSelected[index] = !isSelected[index];
                                  selectedIndex = index;
                                });
                              },
                            ))),
              ),
              productProvider.products.isEmpty
                  ? const Center(child: CircularProgressIndicator(color: Colors.black,))
                  : Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      children: isSelected[0]
                          ? productProvider.products
                              .map((product) => ProductCard(
                                    product: product,
                                  ))
                              .toList()
                          :
                          productProvider.products
                              .where((product) =>
                                  product.category.name ==
                                  productProvider.categories[selectedIndex])
                              .map((product) => ProductCard(
                                    product: product,
                                  ))
                              .toList(),
                    
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
