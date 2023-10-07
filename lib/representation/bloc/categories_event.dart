part of 'categories_bloc.dart';
//functions to be done by the bolc
@immutable
abstract class CategoriesEvent {}

class GetCategories extends CategoriesEvent{

}

class AddCategory extends CategoriesEvent{
  final CategorySection categorySection;

  AddCategory(this.categorySection);

}
