import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';

class TransferSummaryCard extends StatelessWidget {
  const TransferSummaryCard({
    super.key,
    required this.recipient,
    required this.destinationAccount,
    required this.amount,
  });

  final String recipient;
  final String destinationAccount;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.m),
            decoration: const BoxDecoration(
              gradient: AppColors.darkCardGradient,
              borderRadius: AppRadius.radiusM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount to transfer',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.white.withOpacity(0.72),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  amount,
                  style: AppTextStyles.displayMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapL,
          _SummaryRow(
            icon: Icons.person_rounded,
            label: 'Recipient',
            value: recipient,
          ),
          const Divider(height: 32),
          _SummaryRow(
            icon: Icons.account_balance_rounded,
            label: 'Destination Account',
            value: destinationAccount,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.primaryOpacity(0.1),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        AppSpacing.gapM,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodySmall),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
