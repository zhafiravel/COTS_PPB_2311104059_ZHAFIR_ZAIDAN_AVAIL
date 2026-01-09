import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import '../../services/recipe_service.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_page.dart';
import 'add_recipe_page.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    final data = await RecipeService.fetchRecipes();
    setState(() {
      recipes = data;
      isLoading = false;
    });
  }

  Future<void> _openAddPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddRecipePage()),
    );
    fetchData();
  }

  Future<void> _openDetail(Recipe recipe) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipeDetailPage(recipe: recipe),
      ),
    );
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text('Daftar Resep', style: AppTextStyle.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : recipes.isEmpty
                ? _emptyState()
                : ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: recipes[index],
                        onTap: () => _openDetail(recipes[index]),
                      );
                    },
                  ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.receipt_long, size: 64, color: AppColors.textSecondary),
          SizedBox(height: AppSpacing.s16),
          Text(
            'Belum ada resep',
            style: AppTextStyle.section,
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            'Silakan tambahkan resep baru.',
            style: AppTextStyle.body,
          ),
        ],
      ),
    );
  }
}
