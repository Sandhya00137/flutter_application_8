import 'package:flutter/material.dart';
import 'package:flutter_application_8/data/meals_data.dart';
import 'package:flutter_application_8/models/meals_model.dart';
import 'package:flutter_application_8/screens/meals_details_screen.dart';
import 'package:flutter_application_8/widgets/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.mealsList,
    });

  final String? title;
  final List<MealModel> mealsList;

  void _selectCategory(BuildContext context, MealModel meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsDetailScreen(
              selectedMeal: meal);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
        itemCount: dummyMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            singleMeal: mealsList[index],
            onSelectMeal: (BuildContext context, MealModel meal) {
              _selectCategory(context, meal);
            },
          );
        });

    if (mealsList.isEmpty) {
      mainContent = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No data found!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Try different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    if (mealsList.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (ctx, index) => MealItem(singleMeal: mealsList[index], onSelectMeal: _selectCategory)
      );
    }
    if (title == null) {
      return mainContent;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: mainContent);
  }
}
