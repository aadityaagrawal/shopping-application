import 'package:flutter/material.dart';
import 'package:shop/model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  PageController pageController = PageController();

  void forwardPage(int index) {
    pageController.jumpToPage(index + 1);
  }

  void backwardPage(int index) {
    pageController.jumpToPage(index - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.product.category.name, style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.product.images.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      child: Stack(
                        children: [
                          Image.network(
                            widget.product.images[index],
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Center(child:  Icon(Icons.error, size: 50,));
                            },
                            fit: BoxFit.fill,
                          ),
                          index > 0
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    icon: const Icon(
                                        Icons.arrow_back_ios_rounded),
                                    onPressed: () {
                                      backwardPage(index);
                                    },
                                  ))
                              : const SizedBox(),
                          index < widget.product.images.length - 1
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        forwardPage(index);
                                      },
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded)))
                              : const SizedBox(),
                        ],
                      ),
                    );
                  })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "RS ${widget.product.price}/-",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Text("Decription", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 6,
            ),

            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
