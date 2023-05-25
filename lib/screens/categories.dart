import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals.dart';
import '../data/dummy_data.dart';
import 'package:meal_app/widgets/category_gird_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.avaialbeMeals,
  });

  final List<Meal> avaialbeMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = avaialbeMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        meals: filteredMeals,
        title: category.title,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final cat in availableCategories)
          CategoryGridItem(
            category: cat,
            onSelectCategory: () {
              _selectCategory(context, cat);
            },
          ),
      ],
    );
  }
}