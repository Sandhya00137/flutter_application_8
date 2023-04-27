import 'package:flutter/material.dart';
import 'package:flutter_application_8/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

var colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 169, 7, 169));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
      ).copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      // Named routes navigation
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => const TabBarScreen(),
      //   MealsDetailScreen.routeName: (ctx) => const MealsDetailScreen(selectedMeal: []),
      // },

      // onGenerateRoute
      /* if you did not define in routes of screens in route 
      then it will come to ongeenrate route */
          // onGenerateRoute: (settings) {
          // if(settings.name == '/.meals_Screen'){
          //   return MaterialPageRoute(builder: (ctx) => const CategoryScreen(availableMeals: []));
          // }
          // },

      //onUnknownroute
      /* to show blank pages on the screen 404 to prevent crashes */

              //        onUnknownRoute: (settings) {
             //   return MaterialPageRoute(
            //       builder: (ctx) => const CategoryScreen(availableMeals: []));
           // },
      home: const TabBarScreen(),
    );
  }
}
