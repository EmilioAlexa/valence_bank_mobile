import 'package:flutter/material.dart';
import 'colors.dart';

/// Spacing scale used for padding, margins and gaps across the app.
///
/// Based on a 4px grid, which keeps layouts consistent and makes
/// responsive scaling (via [Responsive]) predictable.
class AppSpacing {
  AppSpacing._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  static const EdgeInsets pageHorizontal = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets pagePadding = EdgeInsets.all(m);
  static const EdgeInsets cardPadding = EdgeInsets.all(l);
  static const EdgeInsets listItemPadding =
      EdgeInsets.symmetric(horizontal: m, vertical: s);

  static const SizedBox gapXs = SizedBox(height: xs, width: xs);
  static const SizedBox gapS = SizedBox(height: s, width: s);
  static const SizedBox gapM = SizedBox(height: m, width: m);
  static const SizedBox gapL = SizedBox(height: l, width: l);
  static const SizedBox gapXl = SizedBox(height: xl, width: xl);
}

/// Corner radius scale — keep all rounded corners consistent.
class AppRadius {
  AppRadius._();

  static const double xs = 6;
  static const double s = 10;
  static const double m = 14;
  static const double l = 20;
  static const double xl = 28;
  static const double pill = 999;

  static const BorderRadius radiusXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(s));
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(m));
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(l));
  static const BorderRadius radiusXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius radiusPill =
      BorderRadius.all(Radius.circular(pill));
}

/// Elevation / shadow presets — used instead of ad-hoc [BoxShadow] values.
class AppShadows {
  AppShadows._();

  static List<BoxShadow> get soft => [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> get card => [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.08),
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
      ];

  static List<BoxShadow> get raised => [
        BoxShadow(
          color: AppColors.dark.withOpacity(0.18),
          blurRadius: 30,
          offset: const Offset(0, 14),
        ),
      ];

  static List<BoxShadow> get none => const [];
}
