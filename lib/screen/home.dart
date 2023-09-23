import 'package:flutter/material.dart';

import '../components/restaurant_item.dart';
import '../model/restaurant.dart';
import '../utils/json_parser.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestaurantKu'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/restaurants.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          if (snapshot.hasError) return const Center(child: Text('Data tidak dapat dimuat :('));
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantItem(restaurant: restaurants[index]);
            },
          );
        },
      ),
    );
  }
}

