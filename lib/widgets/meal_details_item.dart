import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsItem extends StatelessWidget {
  const MealDetailsItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Ingredients',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          for (final i in meal.ingredients)
            Text(
              i,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Steps',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          for (final s in meal.steps)
            Text(
              s,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
