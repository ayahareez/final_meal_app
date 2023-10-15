import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/category/data/models/category.dart';
import 'package:meals_app/meal/data/models/meals.dart';
import 'package:meals_app/meal/presentation/widgets/floating_action.dart';
import 'package:meals_app/meal/presentation/widgets/meal_tile.dart';
import 'package:meals_app/category/presentation/widgets/category_bottom_sheet.dart';

import '../../meal_lacal_datasource/meal_lacal_datasource.dart';
import '../bloc/meal_bloc.dart';
import '../widgets/meal_bottom_sheet.dart';

class MealsPage extends StatefulWidget {
  final CategorySection categorySection;
  const MealsPage(this.categorySection, {super.key});

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<MealBloc>().add(GetMeal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey[900],
        title: Text(
          widget.categorySection.categoryName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<MealBloc, MealState>(
        builder: (context, state) {
          return Container(
              color: Colors.black,
              width: double.infinity,
              child: Column(
                children: [
                  if (state is MealLoadingState) CircularProgressIndicator(),
                  if (state is MealLoadedState)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (_, i) => MealTile(
                                meal: state.meals
                                    .where((meal) =>
                                        meal.id == widget.categorySection.id)
                                    .toList()[i],
                              ),
                          separatorBuilder: (_, i) => const SizedBox(
                                height: 16,
                              ),
                          itemCount: state.meals
                              .where((meal) =>
                                  meal.id == widget.categorySection.id)
                              .toList()
                              .length),
                    ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingAction(
        categorySection: widget.categorySection,
      ),
    );
  }
}
// FloatingActionButton(
// onPressed:()=> BottomSheetHandlerMeal.handleBottomSheet(
// imageUrlController: imageUrlController,
// ingredientController: ingredientController,
// stepsController: stepsController,
// difficultyController: difficultyController,
// nameController: nameController,
// standardController: standardController,
// timeController: timeController,
// formKey: formKey,
// categoryId: widget.categorySection.id,
// context: context,
// setStateCallback: () {
// setState(() {
// icon = Icons.edit;
// });
// }),
// child: Icon(Icons.edit),
// ),