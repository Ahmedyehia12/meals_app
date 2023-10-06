import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key, required this.meals, required this.toggleMeal});
  final List<Meal> meals;
  final Function toggleMeal;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              toggleMeal: toggleMeal,
            ));
  }
}
