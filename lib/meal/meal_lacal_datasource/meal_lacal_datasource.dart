import 'dart:convert';

import 'package:meals_app/meal/data/models/meals.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MealLocalDs {
  ///this function get all [Meal]s from the [SharesPreferences] and
  ///take no parameter
  Future<List<Meal>> getMeals();

  ///this function set [Meal] to the [SharesPreferences] and
  ///take [Meal] object as parameter
  Future<void> setMeal(Meal meal);

  ///this function get all fav [Meal]s from the [SharesPreferences] and
  ///take [Meal] object as parameter
  Future<void> setFavMeal(Meal meal);
}

class MealLocalDsImpl extends MealLocalDs {
  String mealsKey = 'meals';
  @override
  Future<List<Meal>> getMeals() async {
    final pref = await SharedPreferences.getInstance();
    final List<String> mealsJson = pref.getStringList(mealsKey) ?? [];
    List<Meal> meals = [];
    for (int i = 0; i < mealsJson.length; i++) {
      String mealJson = mealsJson[i];
      Map<String, dynamic> mealMap = jsonDecode(mealJson);
      Meal meal = Meal.fromMap(mealMap);
      meals.add(meal);
    }
    return meals;
  }

  @override
  Future<void> setMeal(Meal meal) async {
    final pref = await SharedPreferences.getInstance();
    List<String> mealsJson = pref.getStringList(mealsKey) ?? [];
    Map<String, dynamic> mealMap = meal.toMap();
    String mealJson = jsonEncode(mealMap);
    mealsJson.add(mealJson);
    pref.remove(mealsKey);
    pref.setStringList(mealsKey, mealsJson);
  }

  @override
  Future<void> setFavMeal(Meal meal) async {
    final pref = await SharedPreferences.getInstance();
    List<Meal> meals = await getMeals();
    print(meal.isFav);
    pref.remove(mealsKey);
    for (int i = 0; i < meals.length; i++) {
      if (meals[i].idUnique != meal.idUnique) {
        setMeal(meals[i]);
      } else {
        setMeal(meal);
      }
    }
  }
}