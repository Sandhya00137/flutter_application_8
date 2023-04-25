import 'package:flutter/material.dart';

class CategoryModel {
  
  const CategoryModel(
      {required this.color, required this.title, required this.id});

  final String title;
  final String id;
  final Color color;
}
