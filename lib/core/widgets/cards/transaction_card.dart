import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';
import '../../utils/formatters.dart';

enum TransactionType { credit, debit }

/// A single row representing a transaction (incoming/outgoing
/// transfer, bill payment, deposit) — used in transaction lists on
/// the dashboard and the full transaction history screen.
class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.type,
    this.subtitle,
    this.leadingIcon,
    this.onTap,
  });

  final String title;
  final double amount;
  final DateTime dateTime;
  final TransactionType type;
  final String? subtitle;
  final IconData? leadingIcon;
  final VoidCallback? onTap;

  bool get _isCredit => type == TransactionType.credit;

  @override
  Widget build(BuildContext context) {
    final amountStyle = _isCredit ? AppTextStyles.amountPositive : AppTextStyles.amountNegative;
    final sign = _isCredit ? '+' : '-';

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusS,
      child: Padding(
        padding: AppSpacing.listItemPadding,
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: (_isCredit ? AppColors.success : AppColors.primary).withOpacity(0.1),
              child: Icon(
                leadingIcon ?? (_isCredit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded),
                size: 20,
                color: _isCredit ? AppColors.success : AppColors.primary,
              ),
            ),
            AppSpacing.gapM,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle!, style: AppTextStyles.bodySmall),
                  ],
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$sign${Formatters.currency(amount.abs())}', style: amountStyle),
                const SizedBox(height: 2),
                Text(Formatters.relativeTime(dateTime), style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
