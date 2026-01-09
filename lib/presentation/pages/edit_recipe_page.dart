import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import '../../services/recipe_service.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../widgets/primary_button.dart';

class EditRecipePage extends StatefulWidget {
  final Recipe recipe;

  const EditRecipePage({super.key, required this.recipe});

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  late TextEditingController titleController;
  late TextEditingController categoryController;
  late TextEditingController ingredientsController;
  late TextEditingController stepsController;
  late TextEditingController noteController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.recipe.title);
    categoryController = TextEditingController(text: widget.recipe.category);
    ingredientsController =
        TextEditingController(text: widget.recipe.ingredients);
    stepsController = TextEditingController(text: widget.recipe.steps);
    noteController = TextEditingController(text: widget.recipe.note);
  }

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    noteController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTextStyle.body,
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    );
  }

  Future<void> submit() async {
    if (titleController.text.isEmpty ||
        categoryController.text.isEmpty ||
        ingredientsController.text.isEmpty ||
        stepsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Field wajib tidak boleh kosong')),
      );
      return;
    }

    setState(() => isLoading = true);

    await RecipeService.updateRecipe(
      id: widget.recipe.id,
      body: {
        'title': titleController.text,
        'category': categoryController.text,
        'ingredients': ingredientsController.text,
        'steps': stepsController.text,
        'note': noteController.text,
      },
    );

    setState(() => isLoading = false);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text('Edit Resep', style: AppTextStyle.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.s16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: _inputDecoration('Judul Resep'),
                ),
                const SizedBox(height: AppSpacing.s12),
                TextField(
                  controller: categoryController,
                  decoration: _inputDecoration('Kategori'),
                ),
                const SizedBox(height: AppSpacing.s12),
                TextField(
                  controller: ingredientsController,
                  maxLines: 3,
                  decoration: _inputDecoration('Bahan-bahan'),
                ),
                const SizedBox(height: AppSpacing.s12),
                TextField(
                  controller: stepsController,
                  maxLines: 4,
                  decoration: _inputDecoration('Langkah-langkah'),
                ),
                const SizedBox(height: AppSpacing.s12),
                TextField(
                  controller: noteController,
                  maxLines: 2,
                  decoration: _inputDecoration('Catatan'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s24),
          PrimaryButton(
            text: 'Simpan Perubahan',
            loading: isLoading,
            onPressed: submit,
          ),
        ],
      ),
    );
  }
}
