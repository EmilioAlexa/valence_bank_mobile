import 'package:flutter/material.dart';

/// Breakpoints used across Valence Mobile.
///
/// Mobile-first: design and build for [mobile] then progressively
/// adapt for [tablet] / [desktop] as the canvas grows.
class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

enum DeviceType { mobile, tablet, desktop }

/// Static helpers for responsive layout decisions.
///
/// Prefer [Responsive.of] inside `build()` methods (uses [MediaQuery])
/// and reach for [ResponsiveBuilder] when a widget tree itself must
/// branch by available width (uses [LayoutBuilder]).
class Responsive {
  Responsive._();

  static DeviceType of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= Breakpoints.tablet) return DeviceType.desktop;
    if (width >= Breakpoints.mobile) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  static bool isMobile(BuildContext context) => of(context) == DeviceType.mobile;
  static bool isTablet(BuildContext context) => of(context) == DeviceType.tablet;
  static bool isDesktop(BuildContext context) => of(context) == DeviceType.desktop;

  /// Width of [MediaQuery] for the current context.
  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double height(BuildContext context) => MediaQuery.sizeOf(context).height;

  /// Scales a base font/spacing [value] gently between mobile and
  /// tablet so type and spacing don't feel cramped on larger screens.
  static double scale(BuildContext context, double value, {double max = 1.15}) {
    final width = MediaQuery.sizeOf(context).width;
    if (width <= Breakpoints.mobile) return value;
    final factor = (width / Breakpoints.mobile).clamp(1.0, max);
    return value * factor;
  }

  /// Horizontal page padding that widens slightly on tablets so
  /// content doesn't stretch edge-to-edge.
  static EdgeInsets pagePadding(BuildContext context) {
    switch (of(context)) {
      case DeviceType.mobile:
        return const EdgeInsets.symmetric(horizontal: 16);
      case DeviceType.tablet:
        return const EdgeInsets.symmetric(horizontal: 48);
      case DeviceType.desktop:
        return const EdgeInsets.symmetric(horizontal: 120);
    }
  }

  /// Caps content width on large screens (forms, cards) so layouts
  /// stay readable instead of stretching full-bleed.
  static double maxContentWidth(BuildContext context) {
    switch (of(context)) {
      case DeviceType.mobile:
        return double.infinity;
      case DeviceType.tablet:
        return 720;
      case DeviceType.desktop:
        return 960;
    }
  }
}

/// Branches a widget tree by [LayoutBuilder] width — use this when the
/// *structure* of the layout itself needs to change (e.g. a single
/// column on mobile becoming two columns on tablet), as opposed to
/// just tweaking padding or font size.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= Breakpoints.tablet) {
          return (desktop ?? tablet ?? mobile)(context);
        }
        if (width >= Breakpoints.mobile) {
          return (tablet ?? mobile)(context);
        }
        return mobile(context);
      },
    );
  }
}

/// Wraps a screen body with [SafeArea] + [SingleChildScrollView] +
/// a centered, width-capped container — the standard scaffolding
/// every Valence page should use to remain responsive across devices.
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({
    super.key,
    required this.child,
    this.scrollable = true,
    this.padding,
  });

  final Widget child;
  final bool scrollable;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Responsive.maxContentWidth(context)),
        child: Padding(
          padding: padding ?? Responsive.pagePadding(context),
          child: child,
        ),
      ),
    );

    return SafeArea(
      child: scrollable
          ? SingleChildScrollView(child: content)
          : content,
    );
  }
}
