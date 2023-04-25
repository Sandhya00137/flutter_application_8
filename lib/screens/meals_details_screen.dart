import 'package:flutter/material.dart';
import 'package:flutter_application_8/models/meals_model.dart';
import 'package:flutter_application_8/providers/favourites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsDetailScreen extends ConsumerWidget {
  const MealsDetailScreen({super.key, required this.selectedMeal});

  final MealModel selectedMeal;
  // final void Function(MealModel meal) onToggleFavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouritesProvider);

    final isFavourite = favouriteMeals.contains(selectedMeal);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            selectedMeal.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favouritesProvider.notifier)
                    .toggleFavouriteStatus(selectedMeal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(wasAdded
                          ? 'meal is added to favourite.'
                          : 'meal removed.')),
                );
              },
              icon: Icon(isFavourite ? Icons.star : Icons.star_border),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            for (final data in selectedMeal.ingredients)
              Text(
                data,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            for (final data in selectedMeal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
