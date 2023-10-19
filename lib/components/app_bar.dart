import 'package:flutter/material.dart';
import 'item_search_bar.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final String imageUrl;
  const CustomAppBar({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      iconSize: 28,
                      onPressed: () {},
                      icon: const Icon(Icons.notifications)),
                  IconButton(
                      iconSize: 28,
                      onPressed: () {},
                      icon: const Icon(Icons.menu))
                ],
              )
            ],
          ),

        ],
      ),
    ));
  }
}
