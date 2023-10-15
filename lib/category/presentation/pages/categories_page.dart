import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/data/category_local_datasource.dart';
import 'package:meals_app/category/data/models/category.dart';
import 'package:meals_app/meal/presentation/pages/fav_meal_page.dart';
import 'package:meals_app/category/presentation/widgets/category_tile.dart';

import '../../../meal/presentation/widgets/meal_tile.dart';
import '../bloc/categories_bloc.dart';
import '../widgets/category_bottom_sheet.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int index = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();
  var colorController = TextEditingController();
  var idController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoriesBloc>().add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Container(
            color: Colors.black,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                if (state is CategoriesLoading) CircularProgressIndicator(),
                if (state is CategoriesLoaded)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (_, i) => CategoryTile(state.categories[i]),
                      itemCount: state.categories.length,
                    ),
                  )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => BottomSheetHandlerCategory.handleButtonPressed(
              nameController,
              idController,
              context,
              formKey,
              scaffoldKey,
              0xffbc6c25),
          child: Icon(Icons.edit)),
    );
  }
}