import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category/data/models/category.dart';

import '../../../meal/presentation/pages/meals_page.dart';

class CategoryTile extends StatelessWidget {
  final CategorySection categorySection;
  const CategoryTile(this.categorySection, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsPage(categorySection)));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
            color: categorySection.color,
            borderRadius: BorderRadius.circular(32)),
        child: Text(
          categorySection.categoryName,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}