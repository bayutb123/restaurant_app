import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screen/detail.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurant);
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Image border
        child: SizedBox.fromSize(
          size: const Size.fromRadius(48), // Image radius
          child: Hero(
            tag: restaurant.pictureId,
            child: Image.network(
              restaurant.pictureId,
              fit: BoxFit.cover,
              scale: 1.0,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      title: Text(restaurant.name, style: const TextStyle(
        fontWeight: FontWeight.bold
      ),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, size: 12,),
              const SizedBox(width: 4,),
              Text(restaurant.city),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, size: 12,),
              const SizedBox(width: 4,),
              Text(restaurant.rating.toString()),
            ],
          )
        ],
      ),
    );
  }
}
