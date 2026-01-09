import 'package:flutter/material.dart';

import '../../services/recipe_service.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../widgets/primary_button.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final ingredientsController = TextEditingController();
  final stepsController = TextEditingController();
  final noteController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (titleController.text.isEmpty ||
        categoryController.text.isEmpty ||
        ingredientsController.text.isEmpty ||
        stepsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Field wajib tidak boleh kosong'),
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    await RecipeService.addRecipe({
      'title': titleController.text,
      'category': categoryController.text,
      'ingredients': ingredientsController.text,
      'steps': stepsController.text,
      'note': noteController.text,
    });

    setState(() => isLoading = false);
    Navigator.pop(context, true);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text(
          'Tambah Resep',
          style: AppTextStyle.title,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          /// HEADER
          const Text(
            'Form Resep Baru',
            style: AppTextStyle.section,
          ),
          const SizedBox(height: AppSpacing.s8),
          const Text(
            'Lengkapi informasi resep yang akan disimpan.',
            style: AppTextStyle.body,
          ),
          const SizedBox(height: AppSpacing.s24),

          /// FORM CARD
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
                  decoration: _inputDecoration('Catatan (opsional)'),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.s24),

          /// SUBMIT BUTTON
          PrimaryButton(
            text: 'Simpan Resep',
            loading: isLoading,
            onPressed: submit,
          ),
        ],
      ),
    );
  }
}
