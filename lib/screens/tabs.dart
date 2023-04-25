import 'package:flutter/material.dart';
import 'package:flutter_application_8/providers/favourites_provider.dart';
import 'package:flutter_application_8/screens/category_screen.dart';
import 'package:flutter_application_8/screens/filter_screen.dart';
import 'package:flutter_application_8/screens/meals_screen.dart';
import 'package:flutter_application_8/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_8/providers/filter_provider.dart';

const initialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabBarScreen extends ConsumerStatefulWidget {
  const TabBarScreen({super.key});

  @override
  ConsumerState<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends ConsumerState<TabBarScreen> {
  int _selectedPageIndex = 0;
  // final List<MealModel> favouriteList = [];
  // Map<Filter, bool> _selectedFilters = initialFilters;

  // void _favouriteListStatus(MealModel meal) {
  //   final isExisting = favouriteList.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       favouriteList.remove(meal);
  //     });
  //     _showMessage('Meal is no longer');
  //   } else {
  //     setState(() {
  //       favouriteList.add(meal);
  //     });
  //     _showMessage('Marked as a favourite');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      //   return FilterScreen();
      // }));
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(
              // currentAffairs: _selectedFilters,
          ),
        ),
      );
      // } else {
      //   Navigator.of(context).pop();
      // }
      // setState(() {
      //   _selectedFilters = result ?? initialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableLists = ref.watch(filteredMealsProvider);
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filterProvider);
    // final availableLists = meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activeScreen = CategoryScreen(
      availableMeals: availableLists,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouritesProvider);
      activeScreen = MealsScreen(
        mealsList: favouriteMeals,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        activePageTitle,
        style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold),
      )),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
