import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// Typography scale for Valence Mobile, aligned to Material 3's
/// type scale naming (display / headline / title / body / label).
///
/// Uses Inter as a clean, highly-legible typeface suited to financial
/// data. Swap [_fontFamily] for a licensed brand typeface later by
/// pointing it at the custom font declared in `pubspec.yaml`.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
    double? letterSpacing,
    Color color = AppColors.textPrimary,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // Display — hero balances, splash headlines
  static TextStyle displayLarge = _base(fontSize: 40, fontWeight: FontWeight.w700, height: 1.15);
  static TextStyle displayMedium = _base(fontSize: 32, fontWeight: FontWeight.w700, height: 1.2);

  // Headline — page-level headers
  static TextStyle headlineLarge = _base(fontSize: 28, fontWeight: FontWeight.w700, height: 1.25);
  static TextStyle headlineMedium = _base(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3);
  static TextStyle headlineSmall = _base(fontSize: 20, fontWeight: FontWeight.w600, height: 1.3);

  // Title — section headers, card titles
  static TextStyle titleLarge = _base(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle titleMedium = _base(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle titleSmall = _base(fontSize: 14, fontWeight: FontWeight.w600);

  // Body — standard content
  static TextStyle bodyLarge = _base(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);
  static TextStyle bodyMedium = _base(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );
  static TextStyle bodySmall = _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textTertiary,
  );

  // Label — buttons, chips, form labels
  static TextStyle labelLarge = _base(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1);
  static TextStyle labelMedium = _base(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.textSecondary,
  );
  static TextStyle labelSmall = _base(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.textTertiary,
  );

  // Specialized — financial figures (tabular, monospaced digits)
  static TextStyle balanceDisplay = _base(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.white,
  ).copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

  static TextStyle amountPositive = _base(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.success,
  ).copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

  static TextStyle amountNegative = _base(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ).copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

  /// Dark-surface variants — for use on [AppColors.dark] /
  /// [AppColors.primaryDark] backgrounds (e.g. card screens, headers).
  static TextStyle onDark(TextStyle style) => style.copyWith(color: AppColors.white);
}
