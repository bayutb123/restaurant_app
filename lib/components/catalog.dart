import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class Catalog extends StatelessWidget {
  final Restaurant restaurant;

  const Catalog({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 128,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            children: [
              for (var food in restaurant.menus.foods)
                Card(
                  child: Column(
                    children: [
                      Expanded(child: Icon(Icons.food_bank, size: 48)),
                      Text(food.name, overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          height: 128,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            children: [
              for (var drink in restaurant.menus.drinks)
                Card(
                  child: Column(
                    children: [
                      const Expanded(child: Icon(Icons.local_drink, size: 48)),
                      Text(drink.name, overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
