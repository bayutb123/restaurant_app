import 'package:flutter/material.dart';
import 'package:restaurant_app/components/catalog.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Restaurant;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Hero(tag: args.pictureId, child: Image.network(args.pictureId)),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize:
                            Theme.of(context).textTheme.displaySmall?.fontSize),
                  ),
                  Row(
                    children: [
                       Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4,),
                      Text(args.city),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4,),
                      Text(args.rating.toString())
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    args.description,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Catalog(restaurant: args),
          ],
        ),
      ),
    );

  }
}
