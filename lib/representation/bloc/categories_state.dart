part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {

}

class CategoriesLoading extends CategoriesState{

}
class CategoriesLoaded extends CategoriesState{
  final List<CategorySection> cat;

  CategoriesLoaded(this.cat);

}