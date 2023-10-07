import 'dart:convert';

import 'package:meals_app/data/models/meals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';

abstract class MealLocalDs{
  Future<List<Meal>> getMeals();

  Future<void> setMeal(Meal meal);

  Future<void> setFavMeal(Meal meal);

}

class MealLocalDsImpl extends MealLocalDs{
  String mealsKey='meals';
  @override
  Future<List<Meal>> getMeals() async {
    final pref = await SharedPreferences.getInstance();
    final List<String> mealsJson= pref.getStringList(mealsKey)??[];
    List<Meal> meals=[];
    for(int i=0;i<mealsJson.length;i++){
      String mealJson=mealsJson[i];
      Map<String,dynamic> mealMap=jsonDecode(mealJson);
      Meal meal=Meal.fromMap(mealMap);
      meals.add(meal);
    }
    return meals;
  }

  @override
  Future<void> setMeal(Meal meal) async {
    final pref= await SharedPreferences.getInstance();
    List<String> mealsJson= pref.getStringList(mealsKey)??[];
    Map<String,dynamic> mealMap=meal.toMap();
    String mealJson=jsonEncode(mealMap);
    mealsJson.add(mealJson);
    pref.remove(mealsKey);
    pref.setStringList(mealsKey, mealsJson);
  }

  @override
  Future<void> setFavMeal(Meal meal) async {
    final pref=await SharedPreferences.getInstance();
     List<Meal> meals=await getMeals();
    // Meal? meal;
    // for(int i=0;i<meals.length;i++){
    //   if(meals[i].id==id){
    //     meal=meals[i];
    //     break;
    //   }
    // }
    // if (meal == null) {throw Exception('Pet Not Found');}
    print(meal.isFav);
    pref.remove(mealsKey);
    for(int i=0;i<meals.length;i++){
      if(meals[i].id !=meal.id){
        setMeal(meals[i]);
      }
      else{
       setMeal(meal);
      }
    }

  }

}