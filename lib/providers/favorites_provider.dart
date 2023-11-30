import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  bool toggleMealFavoriteStatus(Meal meal) {
    final isExist = state.contains(meal);
    if (isExist) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    }
    // state holds the data
    else {
      state = [...state, meal];
      return true;
      // ... spread operater pulls out the elements in the list as individual objects
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
