import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/formatters.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/dashboard_models.dart';

class StatusTransactionTile extends StatelessWidget {
  const StatusTransactionTile({super.key, required this.transaction});

  final TransactionItemData transaction;

  bool get _isCredit => transaction.amount >= 0;

  Color get _statusColor {
    switch (transaction.status.toLowerCase()) {
      case 'completed':
        return AppColors.success;
      case 'scheduled':
        return AppColors.primary;
      case 'processing':
        return AppColors.warning;
      default:
        return AppColors.textTertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final amountStyle =
        _isCredit ? AppTextStyles.amountPositive : AppTextStyles.amountNegative;
    final sign = _isCredit ? '+' : '-';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: (_isCredit ? AppColors.success : AppColors.primary)
                .withOpacity(0.1),
            child: Icon(
              transaction.icon,
              color: _isCredit ? AppColors.success : AppColors.primary,
              size: 21,
            ),
          ),
          AppSpacing.gapM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type,
                  style: AppTextStyles.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(transaction.date, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sign${Formatters.currency(transaction.amount.abs())}',
                style: amountStyle,
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: _statusColor.withOpacity(0.1),
                  borderRadius: AppRadius.radiusPill,
                ),
                child: Text(
                  transaction.status,
                  style: AppTextStyles.labelSmall.copyWith(color: _statusColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
