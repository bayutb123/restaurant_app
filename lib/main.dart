import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/detail.dart';
import 'package:restaurant_app/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestaurantKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        Home.routeName: (context) => const Home(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      }
    );
  }
}
