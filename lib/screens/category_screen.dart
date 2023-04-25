import 'package:flutter/material.dart';
import 'package:flutter_application_8/data/category_data.dart';
import 'package:flutter_application_8/data/meals_data.dart';
import 'package:flutter_application_8/models/category_model.dart';
import 'package:flutter_application_8/models/meals_model.dart';
import 'package:flutter_application_8/screens/meals_screen.dart';
import 'package:flutter_application_8/widgets/category_item.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key,  required this.availableMeals});

  // final void Function(MealModel meal) onToggleFavourite;
  final List<MealModel> availableMeals;

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(
            title: category.title,
            mealsList: filteredMeals,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // categoryData.map((item) => CategoryItem(categoryItem: item)).toList(),
        for (final item in categoryData)
          CategoryItem(
            categoryItem: item,
            onSelectCategory: () {
              _selectCategory(context, item);
            },
          ),
      ],
    );
  }
}
