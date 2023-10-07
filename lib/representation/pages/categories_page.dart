import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/category_local_datasource/category_local_datasource.dart';
import 'package:meals_app/data/data_source/categories.dart';
import 'package:meals_app/data/models/category.dart';
import 'package:meals_app/representation/bloc/categories_bloc.dart';
import 'package:meals_app/representation/pages/fav_meal_page.dart';
import 'package:meals_app/representation/widgets/category_tile.dart';
import 'package:meals_app/representation/widgets/text_form_field_tile.dart';

import '../widgets/meal_tile.dart';
import '../widgets/category_bottom_sheet.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int index = 0;
  IconData icon = Icons.edit;
  bool isShowBottomSheet = false;
  List<CategorySection> categories=[];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();
  var colorController = TextEditingController();
  var idController = TextEditingController();

  // getCats() async {
  //   categories=await CategoryLocalDsImpl().getCategories();
  //   print(categories);
  //   return categories;
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //context.read<CategoriesBloc>().add(GetCategories());
  //   getCats();
  // }

  // var timeController = TextEditingController();
  // var difficultyController = TextEditingController();
  // var standardController = TextEditingController();
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
      body: Container(
        color: Colors.black,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Expanded(
              child:  FutureBuilder(
                future: CategoryLocalDsImpl().getCategories(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    print(snapshot.data);
                    return GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (_, i) => CategoryTile(snapshot.data![i]),
                      itemCount:snapshot.data!.length ,
                    );
                  }
                  return CircularProgressIndicator();

                }
              ),
    )
  ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => BottomSheetHandlerCategory.handleButtonPressed(
                isShowBottomSheet,
                nameController,
                idController,
                context,
                formKey,
                scaffoldKey,
                () {
                  setState(() {
                    icon = Icons.edit;
                  });
                },
              ),
          child: Icon(icon)),
    );
  }
}