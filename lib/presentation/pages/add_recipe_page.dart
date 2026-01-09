import 'package:flutter/material.dart';
import '../../services/recipe_service.dart';
import '../../design_system/spacing.dart';

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

    await RecipeService.addRecipe({
      'title': titleController.text,
      'category': categoryController.text,
      'ingredients': ingredientsController.text,
      'steps': stepsController.text,
      'note': noteController.text,
    });

    setState(() => isLoading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resep')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: ListView(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Judul Resep')),
            TextField(controller: categoryController, decoration: const InputDecoration(labelText: 'Kategori')),
            TextField(controller: ingredientsController, decoration: const InputDecoration(labelText: 'Bahan-bahan')),
            TextField(controller: stepsController, decoration: const InputDecoration(labelText: 'Langkah-langkah')),
            TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Catatan')),
            const SizedBox(height: AppSpacing.s16),
            ElevatedButton(
              onPressed: isLoading ? null : submit,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
