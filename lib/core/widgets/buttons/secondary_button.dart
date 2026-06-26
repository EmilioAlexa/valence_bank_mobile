import 'package:flutter/material.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';

/// Secondary action button — outlined style, used for actions that
/// support the primary CTA (e.g. "Cancel", "Add Beneficiary" next to
/// "Continue").
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.expand = true,
    this.height = 52,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;
  final double height;

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18),
            AppSpacing.gapS,
          ],
          Text(label, style: AppTextStyles.labelLarge),
        ],
      ),
    );

    final sized = SizedBox(height: height, width: expand ? double.infinity : null, child: button);
    return expand ? sized : IntrinsicWidth(child: sized);
  }
}

/// Low-emphasis tertiary action — used for links such as
/// "Forgot your PIN?" or "Skip for now".
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.underline = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyles.labelLarge.copyWith(
          color: Theme.of(context).colorScheme.primary,
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}

/// Circular icon-only button — used in app bars, quick-action grids
/// (e.g. Home screen's Transfer / Withdraw / Pay Bills shortcuts).
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 44,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: tooltip ?? '',
      child: Material(
        color: backgroundColor ?? scheme.surfaceContainerHighest,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: SizedBox(
            height: size,
            width: size,
            child: Icon(icon, size: size * 0.45, color: iconColor ?? scheme.primary),
          ),
        ),
      ),
    );
  }
}
