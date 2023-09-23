class Restau0rant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restau0rant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restau0rant.fromJson(Map<String, dynamic> json) {
    final List<Foods> foodsList = [];
    final List<Drinks> drinksList = [];

    for (var i = 0; i < json['menus']['foods'].length; i++) {
      foodsList.add(Foods.fromJson(json['menus']['foods'][i]));
    }

    for (var i = 0; i < json['menus']['drinks'].length; i++) {
      drinksList.add(Drinks.fromJson(json['menus']['drinks'][i]));
    }

    return Restau0rant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menus:
        Menus(
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

  factory Menus.fromJson(Map<String, dynamic> json) {
    final List<Foods> foodsList = [];
    final List<Drinks> drinksList = [];

    for (var i = 0; i < json['foods'].length; i++) {
      foodsList.add(Foods.fromJson(json['foods'][i]));
    }

    for (var i = 0; i < json['drinks'].length; i++) {
      drinksList.add(Drinks.fromJson(json['drinks'][i]));
    }

    return Menus(
      foods: foodsList,
      drinks: drinksList,
    );
  }

}

class Foods {
  final List<String> name;

  Foods({
    required this.name,
  });

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
      name: json['name'],
    );
  }
}

class Drinks {
  final List<String> name;

  Drinks({
    required this.name,
  });

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      name: json['name'],
    );
  }
}