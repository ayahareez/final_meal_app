import 'package:flutter/material.dart';
import 'package:meals_app/category/data/category_local_datasource.dart';
import 'package:meals_app/category/presentation/bloc/categories_bloc.dart';
import '../../../shared/widgets/text_form_field_tile.dart';
import '../../data/models/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../meal/data/models/meals.dart';

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

class BottomSheetHandlerCategory {
  static void handleButtonPressed(
      TextEditingController nameController,
      TextEditingController idController,
      BuildContext context,
      GlobalKey<FormState> formKey,
      GlobalKey<ScaffoldState> scaffoldKey,
      int x) {
    Scaffold.of(context).showBottomSheet(
      (context) => Container(
        color: Colors.black,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormTile(
                  controller: nameController,
                  type: TextInputType.text,
                  function: (value) {
                    if (value!.isEmpty) {
                      return 'category name must be entered';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter The Category Name",
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
                  controller: idController,
                  type: TextInputType.number,
                  function: (value) {
                    if (value!.isEmpty) {
                      return 'category id must be entered';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter The Category ID",
                    border: OutlineInputBorder(),
                    prefix: Icon(
                      Icons.title,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final CategorySection category = CategorySection(
                          color: Color(x),
                          categoryName: nameController.text,
                          id: int.parse(idController.text),
                        );
                        context
                            .read<CategoriesBloc>()
                            .add(SetCategory(category));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'))
              ],
            ),
          ),
        ),
      ),
    ); // setStateCallback();
  }
}