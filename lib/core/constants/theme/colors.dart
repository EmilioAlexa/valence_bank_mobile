import 'package:flutter/material.dart';

/// Centralized color system for Valence Mobile.
///
/// All colors used across the app MUST be referenced from this class.
/// Never hardcode a [Color] value inside a widget — add it here first.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // BRAND COLORS
  // ---------------------------------------------------------------------
  static const Color primary = Color(0xFF1668C6);
  static const Color primaryDark = Color(0xFF092A4F);
  static const Color secondary = Color(0xFF585D63);
  static const Color success = Color(0xFF0BC56F);
  static const Color dark = Color(0xFF080C11);
  static const Color white = Color(0xFFE6ECF3);

  // ---------------------------------------------------------------------
  // TINTS & SHADES (derived from brand colors, used for states & depth)
  // ---------------------------------------------------------------------
  static const Color primaryLight = Color(0xFF4A8EE0);
  static const Color primaryLighter = Color(0xFFD6E6FA);
  static const Color secondaryLight = Color(0xFFA7ACB2);
  static const Color successLight = Color(0xFFCFF6E2);

  // ---------------------------------------------------------------------
  // SEMANTIC / STATUS COLORS
  // ---------------------------------------------------------------------
  static const Color error = Color(0xFFE5484D);
  static const Color errorLight = Color(0xFFFBE0E1);
  static const Color warning = Color(0xFFF2A93B);
  static const Color warningLight = Color(0xFFFCEBD2);
  static const Color info = primary;

  // ---------------------------------------------------------------------
  // NEUTRALS — light theme surface scale
  // ---------------------------------------------------------------------
  static const Color background = Color(0xFFF7F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFEFF3F8);
  static const Color outline = Color(0xFFD9E1EA);
  static const Color divider = Color(0xFFE3E8EF);

  // ---------------------------------------------------------------------
  // NEUTRALS — dark theme surface scale
  // ---------------------------------------------------------------------
  static const Color backgroundDark = dark;
  static const Color surfaceDarkTheme = Color(0xFF10161D);
  static const Color surfaceVariantDarkTheme = Color(0xFF1A222C);
  static const Color outlineDarkTheme = Color(0xFF2A333E);
  static const Color dividerDarkTheme = Color(0xFF222B35);

  // ---------------------------------------------------------------------
  // TEXT
  // ---------------------------------------------------------------------
  static const Color textPrimary = Color(0xFF0E1217);
  static const Color textSecondary = Color(0xFF585D63);
  static const Color textTertiary = Color(0xFF8A919A);
  static const Color textOnPrimary = white;
  static const Color textOnDark = white;
  static const Color textDisabled = Color(0xFFB7BEC7);

  // ---------------------------------------------------------------------
  // GRADIENTS — reused across cards, headers, CTAs
  // ---------------------------------------------------------------------
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, Color(0xFF089158)],
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF13202E), dark],
  );

  // ---------------------------------------------------------------------
  // OVERLAYS
  // ---------------------------------------------------------------------
  static Color scrim = dark.withOpacity(0.55);
  static Color shadowColor = primaryDark.withOpacity(0.12);

  /// Returns [primary] with custom opacity — use instead of inline
  /// `.withOpacity()` calls scattered through the UI.
  static Color primaryOpacity(double opacity) => primary.withOpacity(opacity);
}
