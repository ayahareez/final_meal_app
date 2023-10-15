import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/category/data/category_local_datasource.dart';
import 'package:meals_app/category/data/models/category.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is SetCategory) {
        emit(CategoriesLoading());
        await CategoryLocalDsImpl().setCategory(event.categorySection);
        List<CategorySection> categories =
            await CategoryLocalDsImpl().getCategories();
        emit(CategoriesLoaded(categories));
      } else if (event is GetCategories) {
        emit(CategoriesLoading());
        List<CategorySection> categories =
            await CategoryLocalDsImpl().getCategories();
        emit(CategoriesLoaded(categories));
      }
    });
  }
}