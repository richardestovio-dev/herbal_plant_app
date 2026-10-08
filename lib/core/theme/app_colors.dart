import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ============================================================
  // PRIMARY BRAND COLORS
  // ============================================================

  /// Main HerbVision green.
  /// Use this for primary buttons, important icons,
  /// selected states, and major actions.
  static const Color primaryGreen = Color(0xFF2E7D32);

  /// Darker version of the primary green.
  /// Use for headings, icons, and stronger accents.
  static const Color darkGreen = Color(0xFF1B5E20);

  /// Very dark green.
  /// Useful for hero sections and deep accents.
  static const Color deepGreen = Color(0xFF124116);

  /// Soft natural green.
  /// Use for secondary accents.
  static const Color sageGreen = Color(0xFF81A684);

  /// Very light green.
  /// Use for icon backgrounds, selected cards,
  /// and subtle green sections.
  static const Color surfaceGreen = Color(0xFFE8F2E8);

  // ============================================================
  // BACKGROUNDS
  // ============================================================

  /// Main application background.
  static const Color background = Color(0xFFF8FAF7);

  /// Card and component background.
  static const Color surface = Color(0xFFFFFFFF);

  // ============================================================
  // TEXT COLORS
  // ============================================================

  /// Main text.
  static const Color textPrimary = Color(0xFF1B1F1C);

  /// Secondary and supporting text.
  static const Color textSecondary = Color(0xFF68736A);

  /// Text placed on green buttons.
  static const Color textOnGreen = Color(0xFFFFFFFF);

  // ============================================================
  // BORDER
  // ============================================================

  /// Soft border used around cards and inputs.
  static const Color border = Color(0xFFDCE5DC);

  // ============================================================
  // BASIC COLORS
  // ============================================================

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  // ============================================================
  // STATUS COLORS
  // ============================================================

  /// Successful prediction / successful action.
  static const Color success = Color(0xFF43A047);

  /// Warning messages.
  static const Color warning = Color(0xFFF9A825);

  /// Error messages.
  static const Color error = Color(0xFFD84343);
}
