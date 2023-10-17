import 'package:flutter/material.dart';
import 'package:meals_app/category/data/category_local_datasource.dart';
import 'package:meals_app/category/presentation/bloc/categories_bloc.dart';
import '../../../shared/widgets/text_form_field_tile.dart';
import '../../data/models/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../meal/data/models/meals.dart';

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