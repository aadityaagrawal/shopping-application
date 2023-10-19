import 'package:flutter/material.dart';

class ItemSearchBar extends StatelessWidget {
  const ItemSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search for brand",
      hintStyle: MaterialStateProperty.all(
        const TextStyle(color: Colors.grey),
      ),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      leading: const Icon(Icons.search),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 223, 223, 223)),
      elevation: MaterialStateProperty.all(0),
    );
  }
}
