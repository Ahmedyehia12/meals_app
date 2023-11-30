import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals; // dummyMeals is a list of Meal which is returned by the provider
});
