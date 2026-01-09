import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.s12),
      child: ListTile(
        title: Text(recipe.title, style: AppTextStyle.section),
        subtitle: Text(recipe.category),
        onTap: onTap,
      ),
    );
  }
}
