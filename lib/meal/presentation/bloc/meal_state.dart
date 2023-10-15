part of 'meal_bloc.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class MealLoadingState extends MealState {}

class MealLoadedState extends MealState {
  final List<Meal> meals;

  MealLoadedState({required this.meals});
}