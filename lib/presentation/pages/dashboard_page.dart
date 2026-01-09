import 'package:flutter/material.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import 'recipe_list_page.dart';
import 'add_recipe_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resep Masakan')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RecipeListPage()),
              ),
              child: const Text('Daftar Resep'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddRecipePage()),
              ),
              child: const Text('Tambah Resep'),
            ),
          ],
        ),
      ),
    );
  }
}
