import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';

class ReceiptDetailRow extends StatelessWidget {
  const ReceiptDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isAmount = false,
  });

  final String label;
  final String value;
  final bool isAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
        const SizedBox(width: AppSpacing.m),
        Flexible(
          child: Text(
            value,
            style: (isAmount ? AppTextStyles.titleLarge : AppTextStyles.titleMedium)
                .copyWith(color: isAmount ? AppColors.success : AppColors.textPrimary),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
