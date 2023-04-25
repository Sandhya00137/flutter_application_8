import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals_model.dart';

class FavouriteNotifier extends StateNotifier<List<MealModel>> {
  FavouriteNotifier() : super([]);

  bool toggleFavouriteStatus(MealModel meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouriteNotifier, List<MealModel>>((ref) {
  return FavouriteNotifier();
});
