import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

/// Static helpers for the dialogs reused across Valence Mobile —
/// confirmation prompts (e.g. "Confirm Transfer"), simple alerts,
/// and a full-screen loading overlay for async operations like
/// authenticating a transaction.
class AppDialogs {
  AppDialogs._();

  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message, style: AppTextStyles.bodyMedium),
        actionsPadding: const EdgeInsets.fromLTRB(AppSpacing.l, 0, AppSpacing.l, AppSpacing.l),
        actions: [
          Expanded(
            child: SecondaryButton(
              label: cancelLabel,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ),
          AppSpacing.gapS,
          Expanded(
            child: PrimaryButton(
              label: confirmLabel,
              gradient: isDestructive
                  ? const LinearGradient(colors: [AppColors.error, AppColors.error])
                  : null,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  static Future<void> alert(
    BuildContext context, {
    required String title,
    required String message,
    String buttonLabel = 'OK',
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message, style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }

  /// Shows a non-dismissible loading overlay. Caller is responsible
  /// for popping it (e.g. once an API call completes) via
  /// `Navigator.of(context).pop()`.
  static void showLoading(BuildContext context, {String message = 'Please wait...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: AppRadius.radiusL,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.primary),
              AppSpacing.gapM,
              Text(message, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  static void dismiss(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }
}
