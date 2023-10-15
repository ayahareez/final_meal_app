import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../data/models/meals.dart';
import '../../meal_lacal_datasource/meal_lacal_datasource.dart';
import '../bloc/meal_bloc.dart';
import '../widgets/meal_tile.dart';

class FavoriteMealsPage extends StatefulWidget {
  const FavoriteMealsPage({super.key});

  @override
  State<FavoriteMealsPage> createState() => _FavoriteMealsPageState();
}

class _FavoriteMealsPageState extends State<FavoriteMealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Favorite Meals',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<MealBloc, MealState>(
        builder: (context, state) {
          return Container(
              color: Colors.black,
              child: Column(
                children: [
                  if (state is MealLoadingState) CircularProgressIndicator(),
                  if (state is MealLoadedState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (_, i) => MealTile(
                            meal: state.meals
                                .where((meal) => meal.isFav)
                                .toList()[i]),
                        separatorBuilder: (_, i) => const SizedBox(
                          height: 16,
                        ),
                        itemCount: state.meals
                            .where((meal) => meal.isFav)
                            .toList()
                            .length,
                      ),
                    ),
                ],
              ));
        },
      ),
    );
  }
}