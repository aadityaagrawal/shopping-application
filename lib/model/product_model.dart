class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final String creationAt;
  final String updatedAt;
  final Category category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.creationAt,
      required this.updatedAt,
      required this.category});

  static ProductModel fromJSON(Map<String, dynamic> product) {
    return ProductModel(
      id: product["id"],
      title: product["title"],
      price: product["price"],
      description: product["description"],
      images: List<String>.from(product["images"]),
      creationAt: product["creationAt"],
      updatedAt: product["updatedAt"],
      category: Category.fromJson(product["category"]),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updatedAt;

  Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  static Category fromJson(Map<String, dynamic> category) {
    return Category(
        id: category["id"],
        name: category['name'],
        image: category['image'],
        creationAt: category['creationAt'],
        updatedAt: category['updatedAt']);
  }
}
