

import 'package:flutter/material.dart';

import 'meals.dart';

class MealProvider extends ChangeNotifier {
  static Set<Meal> favoriteMeals = {};

  void toggleFavorite(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
    notifyListeners();
  }

  bool isMealFavorite(Meal meal) {
    return favoriteMeals.contains(meal);
  }
}