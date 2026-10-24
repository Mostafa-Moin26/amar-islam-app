import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material 3 থিম, আমাদের ডিজাইন টোকেন দিয়ে কাস্টমাইজ করা।
abstract final class AppTheme {
  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.deepGreen,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.deepGreen,
          onPrimary: Colors.white,
          secondary: AppColors.mutedGold,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          secondaryContainer: AppColors.softSage,
          onSecondaryContainer: AppColors.deepGreen,
          outlineVariant: AppColors.divider,
        );

    final base = ThemeData(useMaterial3: true, colorScheme: colorScheme);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.warmCream,
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.warmCream,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
    );
  }
}
