import 'package:flutter/material.dart';
import 'package:meals_app/representation/pages/categories_page.dart';
import 'package:meals_app/representation/pages/fav_meal_page.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});


  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
 int index =0;
 var pageController;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          // Destination pages
          CategoriesPage(),
          FavoriteMealsPage(),
        ],
        onPageChanged: (int pageIndex) {
          setState(() {
            index = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.black,
        onTap: (int newIndex) {
          setState(() {
            index = newIndex;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, color: Colors.white38),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.white38),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
