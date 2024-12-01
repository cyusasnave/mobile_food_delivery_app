import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (AddOn addOn in food.availableAddons) {
      selectedAddons[addOn] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<AddOn, bool> selectedAddons) {
    Navigator.pop(context);
    List<AddOn> currentSelectedAddons = [];
    for (AddOn addOn in widget.food.availableAddons) {
      if (widget.selectedAddons[addOn] == true) {
        currentSelectedAddons.add(addOn);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context)
                      .colorScheme
                      .tertiary, // Background color
                  width: MediaQuery.of(context).size.width, // Screen width
                  child: Image.asset(
                    widget.food.imagePath,
                    fit: BoxFit.cover, // Adjust how the image fits
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add-Ons',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              AddOn addOn = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                  title: Text(addOn.name),
                                  subtitle: Text('\$${addOn.price}'),
                                  value: widget.selectedAddons[addOn],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addOn] = value!;
                                    });
                                  });
                            }),
                      )
                    ],
                  ),
                ),
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    title: 'Add To Cart'),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              margin: const EdgeInsets.only(left: 25),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_outlined)),
            ),
          ),
        )
      ],
    );
  }
}
