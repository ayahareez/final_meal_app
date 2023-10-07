
import 'package:flutter/material.dart';
import 'package:meals_app/data/data_source/meals_data.dart';
import 'package:meals_app/data/meal_lacal_datasource/meal_lacal_datasource.dart';
import 'package:meals_app/data/models/meal_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/meals.dart';
import '../widgets/meal_tile.dart';

class FavoriteMealsPage extends StatefulWidget {
  const FavoriteMealsPage({super.key});

  @override
  State<FavoriteMealsPage> createState() => _FavoriteMealsPageState();
}

class _FavoriteMealsPageState extends State<FavoriteMealsPage> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(icon: const Icon(Icons.menu,color: Colors.white,),onPressed: (){},),
        title: const Text(
          'Favorite Meals',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
        body:Container(
          color: Colors.black,
          child: FutureBuilder(
            future: MealLocalDsImpl().getMeals(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.separated(
                  itemBuilder: (_,i)=>MealTile(meal: snapshot.data!.where((meal) => meal.isFav==true).toList()[i]),
                  separatorBuilder:(_,i)=>const SizedBox(height: 16,),
                  itemCount:snapshot.data!.where((meal) => meal.isFav==true).toList().length,
                );
              }
              else{
                return CircularProgressIndicator();
              }
            }
          ),
        ),
    );
  }
}