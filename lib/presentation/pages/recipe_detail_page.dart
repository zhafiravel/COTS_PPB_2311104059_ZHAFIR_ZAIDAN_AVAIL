import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import 'edit_recipe_page.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          recipe.title,
          style: AppTextStyle.title,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditRecipePage(recipe: recipe),
                ),
              );

              if (result == true) {
                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          /// KARTU DETAIL
          Container(
            padding: const EdgeInsets.all(AppSpacing.s16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _section('Kategori', recipe.category),
                const SizedBox(height: AppSpacing.s16),

                _section('Bahan-bahan', recipe.ingredients),
                const SizedBox(height: AppSpacing.s16),

                _section('Langkah-langkah', recipe.steps),
                const SizedBox(height: AppSpacing.s16),

                _section(
                  'Catatan',
                  recipe.note.isEmpty ? '-' : recipe.note,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.section),
        const SizedBox(height: AppSpacing.s8),
        Text(content, style: AppTextStyle.body),
      ],
    );
  }
}
