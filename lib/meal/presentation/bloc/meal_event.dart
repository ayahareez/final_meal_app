part of 'meal_bloc.dart';

@immutable
abstract class MealEvent {}

class SetMeal extends MealEvent{
  final Meal meal;

  SetMeal({required this.meal});
}

class GetMeal extends MealEvent{}

class SetFavMeal extends MealEvent{
  final Meal meal;
  SetFavMeal({required this.meal});
}