import 'package:flutter/material.dart';
import 'package:meals_app/data/data_source/categories.dart';
import 'package:meals_app/data/data_source/meals_data.dart';
import 'package:meals_app/data/meal_lacal_datasource/meal_lacal_datasource.dart';
import 'package:meals_app/data/models/category.dart';
import 'package:meals_app/data/models/meals.dart';
import 'package:meals_app/representation/widgets/floating_action.dart';
import 'package:meals_app/representation/widgets/meal_tile.dart';
import 'package:meals_app/representation/widgets/category_bottom_sheet.dart';
import 'package:meals_app/representation/widgets/text_form_field_tile.dart';

import '../widgets/meal_bottom_sheet.dart';

class MealsPage extends StatefulWidget {
  final CategorySection categorySection;
  const MealsPage(this.categorySection, {super.key});

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
 

  

  

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<Meal> meals=[];

  // getMeal() async {
  //   meals= await MealLocalDsImpl().getMeals();
  //   print(meals);
  // }
  @override

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
      body: Container(
        color: Colors.black,
        child: FutureBuilder(
          future: MealLocalDsImpl().getMeals(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print(snapshot.data);
              return ListView.separated(
                  itemBuilder: (_, i) => MealTile(
                    meal:
                    snapshot.data!.where((meal) => meal.id==widget.categorySection.id).toList()[i], onFavState: (){},
                  ),
                  separatorBuilder: (_, i) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: snapshot.data!.where((meal) => meal.id==widget.categorySection.id).toList().length);
            }
            else{
              return CircularProgressIndicator();
            }

          }
        )
      ),
      floatingActionButton: FloatingAction(categorySection: widget.categorySection, onSubmit:()=>setState((){}),),
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