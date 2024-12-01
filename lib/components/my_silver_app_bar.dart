import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MySilverAppBar extends StatefulWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  State<MySilverAppBar> createState() => _MySilverAppBarState();
}

class _MySilverAppBarState extends State<MySilverAppBar> {
  @override
  Widget build(BuildContext context) {
    int totalCartItemCount = context.read<Restaurant>().getTotalItemCount();
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            if (totalCartItemCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '$totalCartItemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunner Dinner'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: widget.child,
        ),
        title: widget.title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, top: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
