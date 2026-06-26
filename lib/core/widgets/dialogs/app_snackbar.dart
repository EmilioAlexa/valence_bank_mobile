import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';

enum SnackType { success, error, info }

/// Standardized snackbars (success / error / info) so feedback
/// messaging looks consistent regardless of which feature triggers it.
class AppSnackbar {
  AppSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    SnackType type = SnackType.info,
  }) {
    final color = switch (type) {
      SnackType.success => AppColors.success,
      SnackType.error => AppColors.error,
      SnackType.info => AppColors.dark,
    };

    final icon = switch (type) {
      SnackType.success => Icons.check_circle_outline_rounded,
      SnackType.error => Icons.error_outline_rounded,
      SnackType.info => Icons.info_outline_rounded,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Row(
            children: [
              Icon(icon, color: AppColors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(child: Text(message, style: const TextStyle(color: AppColors.white))),
            ],
          ),
        ),
      );
  }
}
