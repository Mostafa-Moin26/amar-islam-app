import 'package:flutter/material.dart';

abstract final class AppColors {
  // ============================================================
  // BRAND COLORS
  // ============================================================

  static const Color deepGreen = Color(0xFF0B4F45);
  static const Color darkGreen = Color(0xFF073A33);

  static const Color warmCream = Color(0xFFF7F3E9);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color mutedGold = Color(0xFFD9B66F);
  static const Color softSage = Color(0xFFE4EFE7);

  static const Color splashBackground = Color(0xFF013138);

  // ============================================================
  // TEXT COLORS
  // ============================================================

  static const Color textPrimary = Color(0xFF202722);

  // Improved contrast against white and warm cream surfaces.
  static const Color textSecondary = Color(0xFF68716A);

  static const Color textDisabled = Color(0xFF9CA49D);

  // ============================================================
  // SURFACE COLORS
  // ============================================================

  static const Color surfaceLowest = Color(0xFFFFFFFF);
  static const Color surfaceLow = Color(0xFFFCFAF5);
  static const Color surfaceMedium = Color(0xFFF7F3E9);
  static const Color surfaceHigh = Color(0xFFF0ECE3);
  static const Color surfaceHighest = Color(0xFFE9E5DC);

  static const Color inputFill = Color(0xFFF1F2EF);

  // ============================================================
  // BORDERS AND DIVIDERS
  // ============================================================

  static const Color divider = Color(0xFFE9E5DC);
  static const Color outline = Color(0xFF9AA39B);
  static const Color disabledBorder = Color(0xFFE5E7E3);

  // ============================================================
  // SEMANTIC COLORS
  // ============================================================

  static const Color success = Color(0xFF287A54);
  static const Color successContainer = Color(0xFFE2F2E7);

  static const Color warning = Color(0xFF946217);
  static const Color warningContainer = Color(0xFFFFF2D9);

  static const Color error = Color(0xFFB3261E);
  static const Color errorContainer = Color(0xFFFCE8E6);
  static const Color onErrorContainer = Color(0xFF5F1410);

  static const Color info = Color(0xFF286C91);
  static const Color infoContainer = Color(0xFFE5F2F9);

  // ============================================================
  // INTERACTION COLORS
  // ============================================================

  static const Color primaryOverlay = Color(0x1A0B4F45);
  static const Color selectionBackground = Color(0xFFE4EFE7);

  static const Color shadow = Color(0x14202722);
  static const Color scrim = Color(0x66000000);

  // ============================================================
  // MATERIAL COLOR ROLES
  // ============================================================

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFE4EFE7);
  static const Color onPrimaryContainer = Color(0xFF073A33);

  static const Color onSecondary = Color(0xFF073A33);
  static const Color secondaryContainer = Color(0xFFF5EAD2);
  static const Color onSecondaryContainer = Color(0xFF073A33);

  static const Color tertiary = Color(0xFF52776B);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFE3F0E9);
  static const Color onTertiaryContainer = Color(0xFF183F34);

  static const Color inverseSurface = Color(0xFF073A33);
  static const Color onInverseSurface = Color(0xFFFFFFFF);
  static const Color inversePrimary = Color(0xFFB8DCCB);

  // ============================================================
  // FEATURE CARD BACKGROUNDS
  // ============================================================

  static const Color quranBg = Color(0xFFE7F2EC);
  static const Color salahLearningBg = Color(0xFFE9E9FB);
  static const Color duaBg = Color(0xFFFCEAE6);
  static const Color hadithBg = Color(0xFFE2F1FC);
  static const Color surahLearningBg = Color(0xFFE2F3E4);
  static const Color islamicKnowledgeBg = Color(0xFFEBE9FC);
  static const Color tasbihBg = Color(0xFFFFF0DB);
  static const Color qiblaBg = Color(0xFFE4F5E7);

  // ============================================================
  // FEATURE ICON COLORS
  // ============================================================

  static const Color quranIcon = Color(0xFF176B56);
  static const Color salahLearningIcon = Color(0xFF4665D6);
  static const Color duaIcon = Color(0xFFD85E4E);
  static const Color hadithIcon = Color(0xFF2386C8);
  static const Color surahLearningIcon = Color(0xFF1F7B5A);
  static const Color islamicKnowledgeIcon = Color(0xFF5268CB);
  static const Color tasbihIcon = Color(0xFFC67B36);
  static const Color qiblaIcon = Color(0xFF138765);
}
