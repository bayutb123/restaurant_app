import 'package:flutter/material.dart';

import '../components/restaurant_item.dart';
import '../model/restaurant.dart';
import '../utils/json_parser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [IconButton(onPressed: () {

          }, icon: Icon(Icons.favorite, color: Theme.of(context).colorScheme.onPrimary,))],
          backgroundColor: Theme.of(context).colorScheme.primary,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
            ),
            title: const Text("RestaurantKu"), centerTitle: true,
          ),
        ),
        FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/restaurants.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants =
                parseRestaurants(snapshot.data);
            if (snapshot.hasError) {
              return const Center(child: Text('Data tidak dapat dimuat :('));
            }
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return RestaurantItem(restaurant: restaurants[index]);
            }, childCount: restaurants.length));
          },
        ),
      ],
    ));
  }
}
