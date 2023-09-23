import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class Catalog extends StatelessWidget {
  final Restaurant restaurant;

  const Catalog({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Foods",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 128,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              children: [
                for (var food in restaurant.menus.foods)
                  Card(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                            child: Icon(Icons.food_bank,
                                color: Theme.of(context).colorScheme.primary,
                                size: 48)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            food.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Drinks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 128,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              children: [
                for (var drink in restaurant.menus.drinks)
                  Card(
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Icon(Icons.food_bank,
                                color: Theme.of(context).colorScheme.primary,
                                size: 48)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            drink.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
