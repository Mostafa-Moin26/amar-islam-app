import 'package:flutter/material.dart';

/// অ্যাপের মূল রঙের টোকেন।
/// UI কোডে সরাসরি Color(0xFF...) না লিখে এখান থেকে নিতে হবে।
abstract final class AppColors {
  static const Color deepGreen = Color(0xFF0B4F45);
  static const Color darkGreen = Color(0xFF073A33);
  static const Color warmCream = Color(0xFFF7F3E9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color mutedGold = Color(0xFFD9B66F);
  static const Color softSage = Color(0xFFE4EFE7);
  static const Color textPrimary = Color(0xFF202722);
  static const Color textSecondary = Color(0xFF727A73);
  static const Color divider = Color(0xFFE9E5DC);
}
