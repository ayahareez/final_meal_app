import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/data/category_local_datasource/category_local_datasource.dart';
import 'package:meals_app/data/data_source/categories.dart';
import 'package:meals_app/data/models/category.dart';
import 'package:meta/meta.dart';


part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is AddCategory){
      }
      else if (event is GetCategories){
        emit(CategoriesLoading());
        await Future.delayed(Duration(seconds: 3));
        emit(CategoriesLoaded(await CategoryLocalDsImpl().getCategories()));
      }

    });
  }
}