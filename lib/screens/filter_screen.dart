import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_8/providers/filter_provider.dart';
// import 'package:flutter_application_8/screens/meals_screen.dart';
// import 'package:flutter_application_8/screens/tabs.dart';
// import 'package:flutter_application_8/widgets/main_drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

//   @override
//   ConsumerState<FilterScreen> createState() {
//     return _FilterScreen();
//   }
// }

// class _FilterScreen extends ConsumerState<FilterScreen> {
  // var _glutterFreestatus = false;
  // var _lactoseFreestatus = false;
  // var _vegetarianFreestatus = false;
  // var _veganFreestatus = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeState = ref.read(filterProvider);
  //   _glutterFreestatus = activeState[Filter.glutenFree]!;
  //   _lactoseFreestatus = activeState[Filter.lactoseFree]!;
  //   _vegetarianFreestatus = activeState[Filter.vegetarian]!;
  //   _veganFreestatus = activeState[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.read(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filters',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier) {
        //     Navigator.of(context).pop();
        //     if (identifier == 'meals') {
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (ctx) => const TabBarScreen()),);
        //     }
        //   },
        // ),
        // body: WillPopScope(
        //   onWillPop: () async {
        //     ref.read(filterProvider.notifier).setFilters ({
        //       Filter.glutenFree: _glutterFreestatus,
        //       Filter.lactoseFree: _lactoseFreestatus,
        //       Filter.vegetarian: _vegetarianFreestatus,
        //       Filter.vegan: _veganFreestatus,
        //     });
        //     // Navigator.of(context).pop({});
        //     return true;
        //   },
        body: Column(children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'GLUTEN - FREE MEALS',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 30, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'lactose - FREE MEALS',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 30, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'vegetarian-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'vegetarian - FREE MEALS',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 30, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'vegan-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'vegan - FREE MEALS',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 30, right: 22),
          ),
        ]));
  }
}
