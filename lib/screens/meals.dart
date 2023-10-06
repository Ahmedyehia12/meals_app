import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_list.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, this.title, required this.meals, required this.toggleMeal});
  final String? title; // title of the category
  final List<Meal> meals; // dummy meals list
  final Function toggleMeal;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      // favorites page
      return meals.isNotEmpty
          ? MealsList(
              meals: meals,
              toggleMeal: toggleMeal,
            )
          : const Text('There are no available meals in this Category');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: meals.isNotEmpty
          ? MealsList(
              meals: meals,
              toggleMeal: toggleMeal,
            )
          : const Text('There are no available meals in this Category'),
    );
  }
}
