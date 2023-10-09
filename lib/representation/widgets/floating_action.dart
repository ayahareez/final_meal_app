import 'package:flutter/material.dart';
import 'package:meals_app/data/models/category.dart';
import 'package:meals_app/representation/widgets/text_form_field_tile.dart';

import '../../data/meal_lacal_datasource/meal_lacal_datasource.dart';
import '../../data/models/meals.dart';

class FloatingAction extends StatefulWidget {
  final CategorySection categorySection;
  final Function onSubmit;
  const FloatingAction({super.key, required this.categorySection, required this.onSubmit});
  @override
  State<FloatingAction> createState() => _FloatingActionState();
}

class _FloatingActionState extends State<FloatingAction> {
  var nameController = TextEditingController();

  var colorController = TextEditingController();

  var timeController = TextEditingController();

  var difficultyController = TextEditingController();

  var standardController = TextEditingController();
  var imageUrlController = TextEditingController();
  var ingredientController = TextEditingController();
  var stepsController = TextEditingController();
  var idController = TextEditingController();
  late Meal meal;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isShowBottomSheet = false;

  IconData icon = Icons.edit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
                idUnique: int.parse(idController.text),
              );
              await MealLocalDsImpl().setMeal(meal);
              await MealLocalDsImpl().getMeals().then((value) => print(value));
              //meals.add(meal);
              widget.onSubmit();
              Navigator.pop(context);
              isShowBottomSheet = false;
              setState(() {
                icon = Icons.edit;
              });
            }
          } else {
            // await MealLocalDsImpl().getMeals().then((value) => print(value));
            showBottomSheet(
              context: context,
              builder:
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
                                  color: Colors.grey, // Change the label color here if needed
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
                                color: Colors.grey, // Change the label color here if needed
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
                                color: Colors.grey, // Change the label color here if needed
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
                              color: Colors.grey, // Change the label color here if needed
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
                              color: Colors.grey, // Change the label color here if needed
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
                                  color: Colors.grey, // Change the label color here if needed
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
                                  color: Colors.grey, // Change the label color here if needed
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
                              type: TextInputType.number,
                              function: (value) {
                                if (value!.isEmpty) {
//this msg must be unique
                                  return 'meal id must be entered';
                                }
                                return null;
                              },
                              decoration:  const InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.grey, // Change the label color here if needed
                                ),
                                labelText: "enter the meal id",
                                border: OutlineInputBorder(),
                                prefix: Icon(
                                  Icons.watch_later,
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
      child: Icon(Icons.edit),
    );
  }
}