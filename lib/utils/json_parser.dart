import 'dart:convert';
import '../model/restaurant.dart';

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final Map<String, dynamic> map = jsonDecode(json);
  final List<dynamic> restaurants = map['restaurants'];

  return restaurants.map((json) => Restaurant.fromJson(json)).toList();
}

