import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
        name: 'Aloha Burger',
        description:
            'Juicy beef patty topped with grilled pineapple, teriyaki sauce, and lettuce.',
        imagePath: 'lib/images/burgers/aloha_burger.png',
        price: 12.99,
        category: FoodCategories.burgers,
        availableAddons: [
          AddOn(name: 'Extra cheese', price: 1.50),
          AddOn(name: 'Bacon', price: 2.00),
          AddOn(name: 'Avocado slices', price: 2.50)
        ]),
    Food(
        name: 'BBQ Burger',
        description:
            'Classic beef burger with smoky BBQ sauce, caramelized onions, and pickles.',
        imagePath: 'lib/images/burgers/bbq_burger.avif',
        price: 11.99,
        category: FoodCategories.burgers,
        availableAddons: [
          AddOn(name: 'Jalapeños', price: 1.00),
          AddOn(name: 'Onion rings', price: 2.00),
          AddOn(name: 'Double patty', price: 4.00)
        ]),
    Food(
        name: 'Bluemoon Burger',
        description:
            'Beef patty with blue cheese, arugula, and a tangy aioli sauce.',
        imagePath: 'lib/images/burgers/bluemoon_burger.png',
        price: 13.99,
        category: FoodCategories.burgers,
        availableAddons: [
          AddOn(name: 'Grilled mushrooms', price: 1.50),
          AddOn(name: 'Egg', price: 1.50),
          AddOn(name: 'Garlic aioli', price: 1.00)
        ]),
    Food(
        name: 'Cheese Burger',
        description:
            'A simple classic with melted cheddar cheese, lettuce, and tomato.',
        imagePath: 'lib/images/burgers/cheese_burger.avif',
        price: 9.99,
        category: FoodCategories.burgers,
        availableAddons: [
          AddOn(name: 'Swiss cheese', price: 1.50),
          AddOn(name: 'Crispy bacon', price: 2.00),
          AddOn(name: 'Extra patty', price: 4.00)
        ]),
    Food(
        name: 'Veggie Burger',
        description:
            'Plant-based patty with fresh lettuce, tomato, and vegan mayo.',
        imagePath: 'lib/images/burgers/vege_burger.jpg',
        price: 10.99,
        category: FoodCategories.burgers,
        availableAddons: [
          AddOn(name: 'Guacamole', price: 2.00),
          AddOn(name: 'Vegan cheese', price: 1.50),
          AddOn(name: 'Sautéed onions', price: 1.00)
        ]),
    // desserts
    Food(
        name: 'Bite-Size Dessert',
        description:
            'Mini assorted desserts, including brownie bites and fruit tarts.',
        imagePath: 'lib/images/desserts/bite_size_desserts.webp',
        price: 7.99,
        category: FoodCategories.desserts,
        availableAddons: [
          AddOn(name: 'Whipped cream', price: 0.50),
          AddOn(name: 'Caramel drizzle', price: 0.50),
          AddOn(name: 'Chocolate sauce', price: 0.50)
        ]),
    Food(
        name: 'Chocolate Hazelnut Dessert',
        description: 'A rich chocolate mousse layered with hazelnut cream.',
        imagePath: 'lib/images/desserts/chocolate_hazelnut_desserts.jpg',
        price: 8.99,
        category: FoodCategories.desserts,
        availableAddons: [
          AddOn(name: 'Crushed nuts', price: 1.00),
          AddOn(name: 'Fresh strawberries', price: 1.50),
          AddOn(name: 'Vanilla ice cream', price: 2.00)
        ]),
    Food(
        name: 'Ice Cream Bar Dessert',
        description: 'Assorted ice cream bars in various flavors.',
        imagePath: 'lib/images/desserts/ice_cream_bar_desserts.jpg',
        price: 4.99,
        category: FoodCategories.desserts,
        availableAddons: [
          AddOn(name: 'Sprinkles', price: 0.50),
          AddOn(name: 'Chocolate dip', price: 1.00),
          AddOn(name: 'Nuts', price: 1.00)
        ]),
    Food(
        name: 'Summer Desserts',
        description: 'Seasonal fruit parfaits with a dollop of cream.',
        imagePath: 'lib/images/desserts/summer-desserts.jpg',
        price: 6.99,
        category: FoodCategories.desserts,
        availableAddons: [
          AddOn(name: 'Honey drizzle', price: 0.50),
          AddOn(name: 'Granola', price: 1.00),
          AddOn(name: 'Whipped cream', price: 0.50)
        ]),
    Food(
        name: 'Three Berry Compote Dessert',
        description:
            'A medley of blueberries, strawberries, and raspberries with a hint of citrus.',
        imagePath: 'lib/images/desserts/three_berry_compote_desserts.jpg',
        price: 7.99,
        category: FoodCategories.desserts,
        availableAddons: [
          AddOn(name: 'Greek yogurt', price: 1.50),
          AddOn(name: 'Crushed biscuits', price: 1.00),
          AddOn(name: 'Mint leaves', price: 0.50)
        ]),
    // drinks
    Food(
        name: 'Cocktail Culture Drink',
        description:
            'Creative cocktails with exotic flavors and premium spirits.',
        imagePath: 'lib/images/drinks/Cocktail-Culture_drinks.jpg',
        price: 10.99,
        category: FoodCategories.drinks,
        availableAddons: [
          AddOn(name: 'Extra shot', price: 3.00),
          AddOn(name: 'Fruit garnish', price: 1.00),
          AddOn(name: 'Sugar rim', price: 0.50)
        ]),
    Food(
        name: 'Cold Party Drinks',
        description: 'Large pitchers of iced beverages, perfect for sharing.',
        imagePath: 'lib/images/drinks/cold_party_drinks.webp',
        price: 8.99,
        category: FoodCategories.drinks,
        availableAddons: [
          AddOn(name: 'Extra ice', price: 0.50),
          AddOn(name: 'Fresh fruit slices', price: 1.50),
          AddOn(name: 'Mint leaves', price: 0.50)
        ]),
    Food(
        name: 'Italian Drinks',
        description: 'Classic Italian sodas with refreshing flavors.',
        imagePath: 'lib/images/drinks/italian_drinks.jpg',
        price: 5.99,
        category: FoodCategories.drinks,
        availableAddons: [
          AddOn(name: 'Whipped cream', price: 0.50),
          AddOn(name: 'Flavored syrup', price: 1.00),
          AddOn(name: 'Sparkling water upgrade', price: 0.50)
        ]),
    Food(
        name: 'Refresh Summer Drinks',
        description: 'Seasonal lemonade and iced tea blends.',
        imagePath: 'lib/images/drinks/refresh_summer_drinks.jpeg',
        price: 4.99,
        category: FoodCategories.drinks,
        availableAddons: [
          AddOn(name: 'Fresh mint', price: 0.50),
          AddOn(name: 'Extra lemon', price: 0.50),
          AddOn(name: 'Sweetener', price: 0.50)
        ]),
    Food(
        name: 'Soft Drinks',
        description: 'Assorted sodas and sparkling waters.',
        imagePath: 'lib/images/drinks/soft_drinks.jpeg',
        price: 5.99,
        category: FoodCategories.drinks,
        availableAddons: [
          AddOn(name: 'Ice cubes', price: 0.50),
          AddOn(name: 'Lime wedge', price: 0.50),
          AddOn(name: 'Flavored syrup', price: 0.50)
        ]),
    // Salads
    Food(
        name: 'Asian Sesame Salad',
        description:
            'Mixed greens with sesame dressing, crispy wontons, and mandarin slices.',
        imagePath: 'lib/images/salads/asiansesame_salad.jpg',
        price: 10.99,
        category: FoodCategories.salads,
        availableAddons: [
          AddOn(name: 'Grilled chicken', price: 3.00),
          AddOn(name: 'Tofu', price: 2.50),
          AddOn(name: 'Sesame seeds', price: 1.00)
        ]),
    Food(
        name: 'Caesar Salad',
        description:
            'Crisp romaine lettuce with creamy Caesar dressing and croutons.',
        imagePath: 'lib/images/salads/ceasar_salad.jpg',
        price: 8.99,
        category: FoodCategories.salads,
        availableAddons: [
          AddOn(name: 'Grilled chicken', price: 3.00),
          AddOn(name: 'Parmesan cheese', price: 1.50),
          AddOn(name: 'Anchovies', price: 2.00)
        ]),
    Food(
        name: 'Greek Salad',
        description: 'Fresh cucumbers, tomatoes, olives, and feta cheese.',
        imagePath: 'lib/images/salads/greek_salad.jpg',
        price: 9.99,
        category: FoodCategories.salads,
        availableAddons: [
          AddOn(name: 'Grilled shrimp', price: 4.00),
          AddOn(name: 'Pita bread', price: 1.50),
          AddOn(name: 'Extra olives', price: 1.00)
        ]),
    Food(
        name: 'Quinoa Salad',
        description:
            'Nutritious quinoa with roasted vegetables and a lemon vinaigrette.',
        imagePath: 'lib/images/salads/quiona_salad.avif',
        price: 11.99,
        category: FoodCategories.salads,
        availableAddons: [
          AddOn(name: 'Avocado', price: 2.50),
          AddOn(name: 'Feta cheese', price: 1.50),
          AddOn(name: 'Hard-boiled egg', price: 1.50)
        ]),
    Food(
        name: 'Southwest Salad',
        description:
            'Spicy greens with black beans, corn, and a chipotle lime dressing.',
        imagePath: 'lib/images/salads/southwest_salad.png',
        price: 10.99,
        category: FoodCategories.salads,
        availableAddons: [
          AddOn(name: 'Grilled steak', price: 4.00),
          AddOn(name: 'Tortilla strips', price: 1.00),
          AddOn(name: 'Salsa', price: 1.00)
        ]),
    // sides
    Food(
        name: 'Air Fries Sides',
        description: 'Lightly seasoned and air-fried potato wedges.',
        imagePath: 'lib/images/sides/air_fries_sides.jpg',
        price: 4.99,
        category: FoodCategories.sides,
        availableAddons: [
          AddOn(name: 'Garlic aioli', price: 0.50),
          AddOn(name: 'Parmesan', price: 1.00),
          AddOn(name: 'Ketchup', price: 0.50)
        ]),
    Food(
        name: 'Chips',
        description: 'Traditional potato chips in a variety of flavors.',
        imagePath: 'lib/images/sides/chips_sides.jpg',
        price: 3.99,
        category: FoodCategories.sides,
        availableAddons: [
          AddOn(name: 'Dip (onion, ranch, or guac)', price: 1.50),
          AddOn(name: 'Chili flakes', price: 0.50),
          AddOn(name: 'Extra seasoning', price: 0.50)
        ]),
    Food(
        name: 'Fish and Chips',
        description: 'Beer-battered fish with crispy fries.',
        imagePath: 'lib/images/sides/fishChips_sides.jpg',
        price: 12.99,
        category: FoodCategories.sides,
        availableAddons: [
          AddOn(name: 'Tartar sauce', price: 1.00),
          AddOn(name: 'Lemon wedge', price: 0.50),
          AddOn(name: 'Coleslaw', price: 1.50)
        ]),
    Food(
        name: 'British Chips',
        description: 'Thick-cut fries with a crispy golden exterior.',
        imagePath: 'lib/images/sides/british_chips_sides.jpg',
        price: 5.99,
        category: FoodCategories.sides,
        availableAddons: [
          AddOn(name: 'Malt vinegar', price: 0.50),
          AddOn(name: 'Curry sauce', price: 1.50),
          AddOn(name: 'Cheese sauce', price: 1.50)
        ]),
    Food(
        name: 'Potato Chips',
        description: 'Crunchy potato chips, perfect as a snack.',
        imagePath: 'lib/images/sides/potatochips_sides.jpg',
        price: 2.99,
        category: FoodCategories.sides,
        availableAddons: [
          AddOn(name: 'BBQ seasoning', price: 0.50),
          AddOn(name: 'Cheese dip', price: 1.50),
          AddOn(name: 'Salsa', price: 1.50)
        ]),
  ];

  /*
    G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  /*
    O P E R A T I O N S
  */

  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<AddOn> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool? isSameFood = item.food == food;
      bool? isSameAddons =
          const ListEquality().equals(item.selectedAddOns, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddons));
    }
    notifyListeners();
  }

  // remove from the cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of the cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addOn in cartItem.selectedAddOns) {
        itemTotal += addOn.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    H E L P E R S
  */
  // genarate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt!");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formPrice(cartItem.food.price)}');

      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt.writeln('Add-Ons: ${_formAddOns(cartItem.selectedAddOns)}');
      }
      receipt.writeln();
    }

    receipt.writeln('------------');
    receipt.writeln();
    receipt.writeln('Total items: ${getTotalItemCount()}');
    receipt.writeln('Total price: ${_formPrice(getTotalPrice())}');

    return receipt.toString();
  }

  // format double value into money
  String _formPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // format list of addons into string summary
  String _formAddOns(List<AddOn> addons) {
    return addons
        .map((addon) => '${addon.name} ${_formPrice(addon.price)}')
        .join(', ');
  }
}
