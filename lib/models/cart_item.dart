import 'package:food_delivery_app/models/food.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int quantity;

  CartItem(
      {required this.food, required this.selectedAddOns, this.quantity = 1});

  double get totalPrice {
    double addonsPrice =
        selectedAddOns.fold(0, (sum, addOn) => sum + addOn.price);
    return (food.price + addonsPrice) * quantity;
  }
}
