import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';

/// The main call-to-action button used throughout Valence Mobile
/// (e.g. "Continue", "Send Money", "Confirm Transfer").
///
/// Handles its own loading spinner and disabled state so screens
/// never need to swap in a [CircularProgressIndicator] manually.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.expand = true,
    this.height = 52,
    this.gradient,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final bool expand;
  final double height;

  /// Optional gradient background (defaults to solid [AppColors.primary]
  /// via the theme's [ElevatedButtonTheme] when null).
  final Gradient? gradient;

  bool get _disabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.4,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: Theme.of(context).colorScheme.onPrimary),
                AppSpacing.gapS,
              ],
              Text(label, style: AppTextStyles.labelLarge.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
            ],
          );

    final button = ElevatedButton(
      onPressed: _disabled ? null : onPressed,
      style: gradient == null
          ? null
          : ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
      child: gradient == null
          ? child
          : Ink(
              decoration: BoxDecoration(
                gradient: _disabled ? null : gradient,
                color: _disabled ? AppColors.textDisabled : null,
                borderRadius: AppRadius.radiusM,
              ),
              child: Container(
                height: height,
                alignment: Alignment.center,
                child: child,
              ),
            ),
    );

    final sized = SizedBox(height: height, width: expand ? double.infinity : null, child: button);
    return expand ? sized : IntrinsicWidth(child: sized);
  }
}
