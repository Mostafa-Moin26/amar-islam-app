import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double huge = 28;
  static const double pill = 100;
}

abstract final class AppTheme {
  static ThemeData get light {
    // ----------------------------------------------------------
    // 1. COLOR SCHEME
    // ----------------------------------------------------------

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.deepGreen,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.deepGreen,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,

          secondary: AppColors.mutedGold,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
          onSecondaryContainer: AppColors.onSecondaryContainer,

          tertiary: AppColors.tertiary,
          onTertiary: AppColors.onTertiary,
          tertiaryContainer: AppColors.tertiaryContainer,
          onTertiaryContainer: AppColors.onTertiaryContainer,

          error: AppColors.error,
          onError: Colors.white,
          errorContainer: AppColors.errorContainer,
          onErrorContainer: AppColors.onErrorContainer,

          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,

          surfaceDim: AppColors.surfaceHighest,
          surfaceBright: AppColors.surfaceLowest,

          surfaceContainerLowest: AppColors.surfaceLowest,
          surfaceContainerLow: AppColors.surfaceLow,
          surfaceContainer: AppColors.surfaceMedium,
          surfaceContainerHigh: AppColors.surfaceHigh,
          surfaceContainerHighest: AppColors.surfaceHighest,

          onSurfaceVariant: AppColors.textSecondary,

          outline: AppColors.outline,
          outlineVariant: AppColors.divider,

          shadow: AppColors.shadow,
          scrim: AppColors.scrim,

          inverseSurface: AppColors.inverseSurface,
          onInverseSurface: AppColors.onInverseSurface,
          inversePrimary: AppColors.inversePrimary,

          surfaceTint: AppColors.deepGreen,
        );

    // ----------------------------------------------------------
    // 2. BASE THEME
    // ----------------------------------------------------------

    final base = ThemeData.from(colorScheme: colorScheme, useMaterial3: true);

    // ----------------------------------------------------------
    // 3. TYPOGRAPHY
    // ----------------------------------------------------------

    final textTheme = base.textTheme
        .apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        )
        .copyWith(
          displayLarge: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: AppColors.textPrimary,
          ),

          displayMedium: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: AppColors.textPrimary,
          ),

          displaySmall: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.25,
            color: AppColors.textPrimary,
          ),

          headlineLarge: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: AppColors.textPrimary,
          ),

          headlineMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.3,
            color: AppColors.textPrimary,
          ),

          headlineSmall: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.35,
            color: AppColors.textPrimary,
          ),

          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: AppColors.textPrimary,
          ),

          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.45,
            color: AppColors.textPrimary,
          ),

          titleSmall: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.45,
            color: AppColors.textPrimary,
          ),

          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: AppColors.textPrimary,
          ),

          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.55,
            color: AppColors.textPrimary,
          ),

          bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: AppColors.textSecondary,
          ),

          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: AppColors.textPrimary,
          ),

          labelMedium: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: AppColors.textPrimary,
          ),

          labelSmall: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: AppColors.textSecondary,
          ),
        );

    // ----------------------------------------------------------
    // 4. COMMON BORDER RADIUS
    // ----------------------------------------------------------

    final defaultShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.xl),
    );

    // ----------------------------------------------------------
    // 5. FINAL THEME
    // ----------------------------------------------------------

    return base.copyWith(
      colorScheme: colorScheme,
      textTheme: textTheme,

      scaffoldBackgroundColor: AppColors.warmCream,

      primaryColor: AppColors.deepGreen,
      disabledColor: AppColors.textDisabled,

      dividerColor: AppColors.divider,
      shadowColor: AppColors.shadow,

      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,

      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),

      // --------------------------------------------------------
      // APP BAR
      // --------------------------------------------------------
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.warmCream,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,

        elevation: 0,
        scrolledUnderElevation: 0,

        centerTitle: true,
        toolbarHeight: 60,

        iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 22),

        actionsIconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: 22,
        ),

        titleTextStyle: textTheme.titleLarge,
      ),

      // --------------------------------------------------------
      // CARDS
      // --------------------------------------------------------
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: Colors.transparent,

        shadowColor: AppColors.shadow,
        elevation: 0,

        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          side: const BorderSide(color: AppColors.divider, width: 0.6),
        ),
      ),

      // --------------------------------------------------------
      // INPUT FIELDS
      // --------------------------------------------------------
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColors.inputFill,

        isDense: false,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),

        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
        ),

        labelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
        ),

        floatingLabelStyle: textTheme.bodySmall?.copyWith(
          color: AppColors.deepGreen,
          fontWeight: FontWeight.w600,
        ),

        errorStyle: textTheme.bodySmall?.copyWith(color: AppColors.error),

        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.divider),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.divider),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.deepGreen, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.error),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.disabledBorder),
        ),
      ),

      // --------------------------------------------------------
      // FILLED BUTTONS
      // --------------------------------------------------------
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.deepGreen,
          foregroundColor: AppColors.onPrimary,

          disabledBackgroundColor: AppColors.disabledBorder,
          disabledForegroundColor: AppColors.textDisabled,

          elevation: 0,

          minimumSize: const Size(64, 48),

          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),

          textStyle: textTheme.labelLarge,
        ),
      ),

      // --------------------------------------------------------
      // OUTLINED BUTTONS
      // --------------------------------------------------------
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.deepGreen,

          minimumSize: const Size(64, 48),

          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),

          side: const BorderSide(color: AppColors.divider),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),

          textStyle: textTheme.labelLarge,
        ),
      ),

      // --------------------------------------------------------
      // TEXT BUTTONS
      // --------------------------------------------------------
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.deepGreen,

          minimumSize: const Size(48, 44),

          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),

          textStyle: textTheme.labelLarge,
        ),
      ),

      // --------------------------------------------------------
      // ICON BUTTONS
      // --------------------------------------------------------
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          minimumSize: const Size(44, 44),
          padding: const EdgeInsets.all(AppSpacing.sm),
          shape: const CircleBorder(),
        ),
      ),

      // --------------------------------------------------------
      // BOTTOM NAVIGATION
      // --------------------------------------------------------
      navigationBarTheme: NavigationBarThemeData(
        height: 72,

        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,

        elevation: 0,
        shadowColor: Colors.transparent,

        indicatorColor: AppColors.softSage,

        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),

        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
          final isSelected = states.contains(WidgetState.selected);

          return IconThemeData(
            color: isSelected ? AppColors.deepGreen : AppColors.textSecondary,
            size: isSelected ? 24 : 22,
          );
        }),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
          final isSelected = states.contains(WidgetState.selected);

          return textTheme.labelMedium?.copyWith(
            color: isSelected ? AppColors.deepGreen : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          );
        }),

        overlayColor: const WidgetStatePropertyAll<Color?>(
          AppColors.primaryOverlay,
        ),
      ),

      // --------------------------------------------------------
      // TAB BAR
      // --------------------------------------------------------
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.deepGreen,
        unselectedLabelColor: AppColors.textSecondary,

        indicatorColor: AppColors.deepGreen,
        indicatorSize: TabBarIndicatorSize.label,

        dividerColor: AppColors.divider,
        dividerHeight: 1,

        labelStyle: textTheme.labelLarge,
        unselectedLabelStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),

        labelPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      ),

      // --------------------------------------------------------
      // DIALOGS
      // --------------------------------------------------------
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,

        elevation: 0,

        shape: defaultShape,

        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,

        actionsPadding: const EdgeInsets.all(AppSpacing.lg),
      ),

      // --------------------------------------------------------
      // BOTTOM SHEETS
      // --------------------------------------------------------
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        modalBackgroundColor: AppColors.surface,

        surfaceTintColor: Colors.transparent,

        elevation: 0,
        modalElevation: 0,

        showDragHandle: true,
        dragHandleColor: AppColors.outline,
        dragHandleSize: Size(36, 4),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xxl),
          ),
        ),

        clipBehavior: Clip.antiAlias,
      ),

      // --------------------------------------------------------
      // SNACKBARS
      // --------------------------------------------------------
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,

        backgroundColor: AppColors.darkGreen,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),

        actionTextColor: AppColors.mutedGold,

        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),

        insetPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),

      // --------------------------------------------------------
      // DIVIDERS
      // --------------------------------------------------------
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // --------------------------------------------------------
      // PROGRESS INDICATORS
      // --------------------------------------------------------
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.deepGreen,
        linearTrackColor: AppColors.softSage,
        circularTrackColor: AppColors.softSage,
      ),
    );
  }
}
