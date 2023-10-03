import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_list.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title; // title of the category
  final List<Meal> meals; // dummy meals list
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? MealsList(meals: meals)
          : const Text('There are no available meals in this Category'),
    );
  }
}
