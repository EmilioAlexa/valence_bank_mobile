import 'package:flutter/material.dart';
import '../../constants/theme/spacing.dart';

/// Base surface used for any card-like container — settings rows,
/// list groupings, info panels. Specialized cards (balance,
/// transaction) build on top of this for consistent radius/shadow.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.color,
    this.onTap,
    this.showShadow = true,
    this.borderRadius = AppRadius.radiusM,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final VoidCallback? onTap;
  final bool showShadow;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? scheme.surface,
        borderRadius: borderRadius,
        boxShadow: showShadow ? AppShadows.soft : AppShadows.none,
      ),
      child: child,
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: card,
      ),
    );
  }
}
