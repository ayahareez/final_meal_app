import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/meal/meal_lacal_datasource/meal_lacal_datasource.dart';
import 'package:meta/meta.dart';

import '../../data/models/meals.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) async {
      if(event is SetMeal){
        emit(MealLoadingState());
        await MealLocalDsImpl().setMeal(event.meal);
        List<Meal> meals=await MealLocalDsImpl().getMeals();
        emit(MealLoadedState(meals:meals ));
      }
      if(event is GetMeal){
        emit(MealLoadingState());
        List<Meal> meals=await MealLocalDsImpl().getMeals();
        emit(MealLoadedState(meals:meals ));
      }
      if(event is SetFavMeal){
        emit(MealLoadingState());
        await MealLocalDsImpl().setFavMeal(event.meal);
        List<Meal> meals=await MealLocalDsImpl().getMeals();
        emit(MealLoadedState(meals:meals ));
      }
    });
  }
}