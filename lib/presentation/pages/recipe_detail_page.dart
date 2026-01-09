import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: ListView(
          children: [
            Text('Kategori', style: AppTextStyle.section),
            Text(recipe.category),
            const SizedBox(height: AppSpacing.s12),

            Text('Bahan-bahan', style: AppTextStyle.section),
            Text(recipe.ingredients),
            const SizedBox(height: AppSpacing.s12),

            Text('Langkah-langkah', style: AppTextStyle.section),
            Text(recipe.steps),
            const SizedBox(height: AppSpacing.s12),

            Text('Catatan', style: AppTextStyle.section),
            Text(recipe.note.isEmpty ? '-' : recipe.note),
          ],
        ),
      ),
    );
  }
}
