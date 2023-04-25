import 'package:flutter/material.dart';
import 'package:flutter_application_8/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';


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
      home: const TabBarScreen(),
    );
  }
}
