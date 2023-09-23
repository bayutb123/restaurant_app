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
        child: Column(
          children: [
            Image.network(args.pictureId),
            SizedBox(height: 16),
            Text(args.description),
            Catalog(restaurant: args),
          ],
        ),
      ),
    );
  }
}
