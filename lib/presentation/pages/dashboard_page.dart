import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';

import '../widgets/primary_button.dart';
import 'recipe_list_page.dart';
import 'add_recipe_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text(
          'Resep Masakan',
          style: AppTextStyle.title,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            const Text(
              'Selamat Datang',
              style: AppTextStyle.title,
            ),
            const SizedBox(height: AppSpacing.s8),
            const Text(
              'Kelola dan simpan resep masakan favorit Anda dengan mudah.',
              style: AppTextStyle.body,
            ),

            const SizedBox(height: AppSpacing.s24),

            /// CARD MENU
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Daftar Resep',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RecipeListPage(),
                        ),
                      );
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
