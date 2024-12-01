class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategories category;
  List<AddOn> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons});
}

enum FoodCategories { burgers, salads, sides, desserts, drinks }

class AddOn {
  String name;
  double price;

  AddOn({required this.name, required this.price});
}
