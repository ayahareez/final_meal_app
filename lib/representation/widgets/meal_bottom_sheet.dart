import 'package:flutter/material.dart';
import 'package:meals_app/data/category_local_datasource/category_local_datasource.dart';
import 'package:meals_app/representation/widgets/text_form_field_tile.dart';

import '../../data/data_source/categories.dart';
import '../../data/data_source/meals_data.dart';
import '../../data/models/category.dart';
import '../../data/models/meals.dart';


class BottomSheetHandlerMeal {
  static void handleBottomSheet(
      {required TextEditingController imageUrlController,
        required TextEditingController ingredientController,
        required TextEditingController stepsController,
        required TextEditingController difficultyController,
        required TextEditingController nameController,
        required TextEditingController standardController,
        required TextEditingController timeController,
        required TextEditingController idController,
        required GlobalKey<FormState> formKey,
        required int categoryId,
        required BuildContext context,
        required VoidCallback setStateCallback}) {
    Scaffold.of(context).showBottomSheet(
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
                      labelText: "enter the time will be taken",
                      border: OutlineInputBorder(),
                      prefix: Icon(
                        Icons.timelapse_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormTile(
                      controller: standardController,
                      type: TextInputType.text,
                      function: (value) {
                        if (value!.isEmpty) {
                          //this msg must be unique
                          return 'standard must be entered';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
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
                      },
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
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
                      decoration: const InputDecoration(
                        labelText: "enter the meal steps",
                        border: OutlineInputBorder(),
                        prefix: Icon(
                          Icons.watch_later,
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final Meal meal = Meal(
                              name: nameController.text,
                              time: timeController.text,
                              standard: standardController.text,
                              difficulty: difficultyController.text,
                              imageUrl: 'assets/images/chicken.jpg',
                              id: categoryId,
                              steps: stepsController.text,
                              ingredients: ingredientController.text, idUnique: int.parse(idController.text),
                            );

                          //meals.add(meal);
                          Navigator.pop(context);
                          setStateCallback;
                          // setState(() {
                          //   icon = Icons.edit;
                          // });
                        }
                      },
                      child: Text('Add'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class BottomSheetVisibility extends StatefulWidget {
//    BottomSheetVisibility({Key? key, required this.nameController, required this.idController, required this.context}) : super(key: key);
//   final TextEditingController nameController;
//   final TextEditingController idController;
//   final BuildContext context;
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   final GlobalKey<FormState> formKey = GlobalKey();
//
//   @override
//   State<BottomSheetVisibility> createState() => _BottomSheetVisibilityState();
// }
//
// class _BottomSheetVisibilityState extends State<BottomSheetVisibility> {
//   IconData icon = Icons.edit;
//   bool isShowBottomSheet = false;
//   late CategorySection category;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             if (isShowBottomSheet) {
//               if (widget.formKey.currentState!.validate()) {
//                 category = CategorySection(
//                     color: Colors.teal,
//                     categoryName: widget.nameController.text,
//                     id: int.parse(widget.idController.text));
//                 categories.add(category);
//                 Navigator.pop(context);
//                 isShowBottomSheet = false;
//                 setState(() {
//                   icon = Icons.edit;
//                 });
//               }
//             } else {
//               widget.scaffoldKey.currentState!.showBottomSheet(
//                     (context) => Container(
//                   color: Colors.black,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Form(
//                       key: widget.formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextFormTile(
//                               controller: widget.nameController,
//                               type: TextInputType.text,
//                               function: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'category name must be entered';
//                                 }
//                                 return null;
//                               },
//                               decoration: const InputDecoration(
//                                 labelText: "Enter The Category Name",
//                                 border: OutlineInputBorder(),
//                                 prefix: Icon(
//                                   Icons.title,
//                                 ),
//                               )),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           // TextFormTile(
//                           //     controller: colorController,
//                           //     type: TextInputType.number,
//                           //     decoration: const InputDecoration(
//                           //   labelText: "Enter The Category Color",
//                           //   border: OutlineInputBorder(),
//                           //   prefix: Icon(
//                           //     Icons.title,
//                           //   ),
//                           // )),
//                           TextFormTile(
//                             controller: widget.idController,
//                             type: TextInputType.number,
//                             function: (value) {
//                               if (value!.isEmpty) {
//                                 return 'category id must be entered';
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                               labelText: "Enter The Category ID",
//                               border: OutlineInputBorder(),
//                               prefix: Icon(
//                                 Icons.title,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//               isShowBottomSheet = true;
//               setState(() {
//                 icon = Icons.add;
//               });
//             }
//           },
//           child: Icon(icon)),
//     );
//   }
// }