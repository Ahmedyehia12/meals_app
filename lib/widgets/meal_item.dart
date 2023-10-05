import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
  } // Navigate to a different screen but not updating the state

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge, // to inforce the shape
      elevation: 2,
      child: InkWell(
        onTap: () {
          _selectMeal(context, meal);
        },
        child: Stack(
          // stack ignores the shape on card
          children: [
            // starting from bottom
            FadeInImage(
              // loaded in a smooth way
              placeholder:
                  MemoryImage(kTransparentImage), // nothing as a place holder
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // image won't be distorted, cut off
              height: 200, // fixed height
              width: double.infinity, // take all available width
            ), // Faded In
            Positioned(
                bottom: 0, // beginning at bottom
                left: 0, // from left border
                right: 0, // to right border
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis, // ... after it
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              // no need for expanded because  the Positioned Widget has limits on width
                              // Positioned ->Container ->Row ->child Row.
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: '$complexityText'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: '$affordabilityText ')
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
