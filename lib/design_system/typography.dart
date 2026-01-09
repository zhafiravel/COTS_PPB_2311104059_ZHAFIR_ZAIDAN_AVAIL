import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const section = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
