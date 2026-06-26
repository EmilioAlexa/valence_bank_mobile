import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/dashboard_models.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/status_transaction_tile.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  static const routeName = '/transactions';

  static const _transactions = [
    TransactionItemData(
      icon: Icons.shopping_bag_rounded,
      type: 'Card Purchase',
      date: 'Today, 10:48 AM',
      amount: -128.45,
      status: 'Completed',
    ),
    TransactionItemData(
      icon: Icons.arrow_downward_rounded,
      type: 'Incoming Transfer',
      date: 'Yesterday, 4:12 PM',
      amount: 2450,
      status: 'Completed',
    ),
    TransactionItemData(
      icon: Icons.home_work_rounded,
      type: 'Mortgage Payment',
      date: 'Jun 24, 2026',
      amount: -980,
      status: 'Scheduled',
    ),
    TransactionItemData(
      icon: Icons.local_cafe_rounded,
      type: 'Coffee House',
      date: 'Jun 23, 2026',
      amount: -9.80,
      status: 'Completed',
    ),
    TransactionItemData(
      icon: Icons.wifi_rounded,
      type: 'Internet Service',
      date: 'Jun 22, 2026',
      amount: -64.99,
      status: 'Processing',
    ),
    TransactionItemData(
      icon: Icons.savings_rounded,
      type: 'Savings Deposit',
      date: 'Jun 21, 2026',
      amount: 700,
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ValenceAppBar(title: 'Transactions', showBackButton: false),
          AppSpacing.gapM,
          Text('Activity', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 6),
          Text(
            'A clear view of every account movement.',
            style: AppTextStyles.bodyMedium,
          ),
          AppSpacing.gapL,
          AppCard(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
            child: Column(
              children: [
                for (final transaction in _transactions)
                  StatusTransactionTile(transaction: transaction),
              ],
            ),
          ),
          AppSpacing.gapXl,
        ],
      ),
    );
  }
}
