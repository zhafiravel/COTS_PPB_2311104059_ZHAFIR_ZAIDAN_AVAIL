import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../../services/recipe_service.dart';
import '../widgets/primary_button.dart';
import 'recipe_list_page.dart';
import 'add_recipe_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int total = 0;
  int sarapan = 0;
  int makanSiang = 0;
  int makanMalam = 0;
  int dessert = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  Future<void> loadStats() async {
    final t = await RecipeService.countAll();
    final s = await RecipeService.countByCategory('Sarapan');
    final ms = await RecipeService.countByCategory('Makan Siang');
    final mm = await RecipeService.countByCategory('Makan Malam');
    final d = await RecipeService.countByCategory('Dessert');

    setState(() {
      total = t;
      sarapan = s;
      makanSiang = ms;
      makanMalam = mm;
      dessert = d;
      isLoading = false;
    });
  }

  Widget statCard(String title, int value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(title, style: AppTextStyle.caption),
            const SizedBox(height: AppSpacing.s8),
            Text(value.toString(), style: AppTextStyle.title),
          ],
        ),
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
        title: const Text('Dashboard', style: AppTextStyle.title),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.s16),
              children: [
                const Text('Statistik Resep', style: AppTextStyle.section),
                const SizedBox(height: AppSpacing.s12),

                Row(
                  children: [
                    statCard('Total', total),
                    const SizedBox(width: AppSpacing.s12),
                    statCard('Sarapan', sarapan),
                  ],
                ),
                const SizedBox(height: AppSpacing.s12),
                Row(
                  children: [
                    statCard('Makan Siang', makanSiang),
                    const SizedBox(width: AppSpacing.s12),
                    statCard('Makan Malam', makanMalam),
                  ],
                ),
                const SizedBox(height: AppSpacing.s12),
                Row(
                  children: [
                    statCard('Dessert', dessert),
                  ],
                ),

                const SizedBox(height: AppSpacing.s24),
                PrimaryButton(
                  text: 'Daftar Resep',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RecipeListPage(),
                      ),
                    ).then((_) => loadStats());
                  },
                ),
                const SizedBox(height: AppSpacing.s12),
                PrimaryButton(
                  text: 'Tambah Resep',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddRecipePage(),
                      ),
                    ).then((_) => loadStats());
                  },
                ),
              ],
            ),
    );
  }
}
