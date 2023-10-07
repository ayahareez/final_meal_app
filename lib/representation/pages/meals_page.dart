import 'package:flutter/material.dart';
import 'package:meals_app/data/data_source/categories.dart';
import 'package:meals_app/data/data_source/meals_data.dart';
import 'package:meals_app/data/meal_lacal_datasource/meal_lacal_datasource.dart';
import 'package:meals_app/data/models/category.dart';
import 'package:meals_app/data/models/meals.dart';
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
  bool isShowBottomSheet = false;

  IconData icon = Icons.edit;

  late Meal meal;

  var nameController = TextEditingController();

  var colorController = TextEditingController();

  var timeController = TextEditingController();

  var difficultyController = TextEditingController();

  var standardController = TextEditingController();
  var imageUrlController = TextEditingController();
  var ingredientController = TextEditingController();
  var stepsController = TextEditingController();
  var idController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey<FormState> formKey = GlobalKey();
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
                    snapshot.data![i],
                  ),
                  separatorBuilder: (_, i) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: snapshot.data!.length);
            }
            else{
              return CircularProgressIndicator();
            }

          }
        )
      ),
      floatingActionButton:
      FloatingActionButton(
          onPressed: () async {
            if (isShowBottomSheet) {
              if (formKey.currentState!.validate()) {
                meal = Meal(
                    name: nameController.text,
                    time: timeController.text,
                    standard: standardController.text,
                    difficulty: difficultyController.text,
                    imageUrl: 'assets/images/chicken.jpg',
                    id: widget.categorySection.id,
                    steps: stepsController.text,
                    ingredients: ingredientController.text,
                 );
                await MealLocalDsImpl().setMeal(meal);
                await MealLocalDsImpl().getMeals().then((value) => print(value));
                //meals.add(meal);
                Navigator.pop(context);
                isShowBottomSheet = false;
                setState(() {
                  icon = Icons.edit;
                });
              }
            } else {
              // await MealLocalDsImpl().getMeals().then((value) => print(value));
              scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormTile(
                                controller: nameController,
                                type: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
                                    return 'meal name must be entered';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white, // Change the label color here if needed
                                  ),
                                  labelText: "Enter The meal Name",
                                  border: OutlineInputBorder(),
                                  prefix: Icon(
                                    Icons.title,
                                  ),
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                              controller: difficultyController,
                              type: TextInputType.text,
                              function: (value) {
                                if (value!.isEmpty) {
                                  return 'meal diff must be entered';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.white, // Change the label color here if needed
                                ),
                                labelText: "Enter The meal diff",
                                border: OutlineInputBorder(),
                                prefix: Icon(
                                  Icons.title,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                              controller: timeController,
                              type: TextInputType.text,
                              function: (value) {
                                if (value!.isEmpty) {
                                  return 'time must be entered';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.white, // Change the label color here if needed
                                ),
                                labelText: "enter the time will be taken",
                                border: OutlineInputBorder(),
                                prefix: Icon(
                                  Icons.timelapse_outlined,
                                ),
                              ),),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                                controller: standardController,
                                type: TextInputType.text,
                                function:(value) {
                                  if (value!.isEmpty) {
//this msg must be unique
                                    return 'standard must be entered';
                                  }
                                  return null;
                                }, decoration: const InputDecoration(

                              labelStyle: TextStyle(
                                color: Colors.white, // Change the label color here if needed
                              ),
                              labelText: "enter the standard",
                              border: OutlineInputBorder(),
                              prefix: Icon(
                                Icons.watch_later,
                              ),
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                                controller: imageUrlController,
                                type: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
//this msg must be unique
                                    return 'image URL must be entered';
                                  }
                                  return null;
                                }, decoration:const InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.white, // Change the label color here if needed
                              ),
                              labelText: "enter the Image URL",
                              border: OutlineInputBorder(),
                              prefix: Icon(
                                Icons.watch_later,
                              ),
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                                controller: ingredientController,
                                type: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
//this msg must be unique
                                    return 'ingredients must be entered';
                                  }
                                  return null;
                                },
                                decoration:const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white, // Change the label color here if needed
                                  ),
                                  labelText: "enter the  meal ingredients",
                                  border: OutlineInputBorder(),
                                  prefix: Icon(
                                    Icons.watch_later,
                                  ),
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                                controller: stepsController,
                                type: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
//this msg must be unique
                                    return 'steps must be entered';
                                  }
                                  return null;
                                },
                                decoration:  const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white, // Change the label color here if needed
                                  ),
                                  labelText: "enter the meal steps",
                                  border: OutlineInputBorder(),
                                  prefix: Icon(
                                    Icons.watch_later,
                                  ),
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormTile(
                                controller: idController,
                                type: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
                                    return 'meal id must be entered';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white, // Change the label color here if needed
                                  ),
                                  labelText: "Enter The meal id",
                                  border: OutlineInputBorder(),
                                  prefix: Icon(
                                    Icons.title,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
              isShowBottomSheet = true;
              setState(() {
                icon = Icons.add;
              });
            }
          },
          child: Icon(icon))
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