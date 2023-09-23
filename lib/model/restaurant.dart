class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String pictureId;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final List<Foods> foodsList = [];
    final List<Drinks> drinksList = [];

    for (var i = 0; i < json['menus']['foods'].length; i++) {
      foodsList.add(Foods.fromJson(json['menus']['foods'][i]));
    }

    for (var i = 0; i < json['menus']['drinks'].length; i++) {
      drinksList.add(Drinks.fromJson(json['menus']['drinks'][i]));
    }

    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      pictureId: json['pictureId'],
      rating: json['rating'].toDouble(),
      menus: Menus(
        foods: foodsList,
        drinks: drinksList,
      ),
    );
  }
}

class Menus {

  final List<Foods> foods;
  final List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

}

class MenuItem {
  final String name;

  MenuItem({
    required this.name,
  });
}

class Foods extends MenuItem {
  Foods({
    required String name,
  }) : super(name: name);

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
      name: json['name'],
    );
  }
}

class Drinks extends MenuItem {
  Drinks({
    required String name,
  }) : super(name: name);

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      name: json['name'],
    );
  }
}