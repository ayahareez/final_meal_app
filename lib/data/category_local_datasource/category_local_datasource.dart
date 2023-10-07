import 'dart:convert';
import 'dart:core';


import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';

abstract class CategoryLocalDs{

  Future<List<CategorySection>> getCategories();

  Future<void> setCategory(CategorySection categorySection);

}



class CategoryLocalDsImpl extends CategoryLocalDs{

  String catsKey='categoryKey';

  @override
  Future<List<CategorySection>> getCategories() async {
    final pref=await SharedPreferences.getInstance();
    final List<String> categoriesString = pref.getStringList(catsKey)??[];
    List<CategorySection> cat=[];
      for(int i=0;i<categoriesString.length;i++){
        String categoryString=categoriesString[i];
         Map<String,dynamic> categoryMap=jsonDecode(categoryString);
        CategorySection categorySec=CategorySection.fromMap(categoryMap);
        cat.add(categorySec);
    }
    return cat;
  }

  @override
  Future<void> setCategory(CategorySection categorySection) async {
    final pref=await SharedPreferences.getInstance();
    final Map<String,dynamic> catMap=categorySection.toMap();
    final String catJson=jsonEncode(catMap);
    final List<String> catList= pref.getStringList(catsKey)??[];
    catList.add(catJson);
    pref.remove(catsKey);
    pref.setStringList(catsKey, catList);
  }



}