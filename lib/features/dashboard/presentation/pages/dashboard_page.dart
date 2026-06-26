import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/dashboard_models.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/quick_action_grid.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/section_header.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/status_transaction_tile.dart';
import 'package:valence_mobile/features/maps/presentation/pages/branches_page.dart';
import 'package:valence_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:valence_mobile/features/transactions/presentation/pages/transactions_page.dart';
import 'package:valence_mobile/features/transfer/presentation/pages/transfer_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const _actions = [
    QuickActionData(
      Icons.swap_horiz_rounded,
      'Transfer',
      routeName: TransferPage.routeName,
    ),
    QuickActionData(Icons.receipt_long_rounded, 'Transactions'),
    QuickActionData(
      Icons.location_on_rounded,
      'Branches',
      routeName: BranchesPage.routeName,
    ),
    QuickActionData(
      Icons.person_rounded,
      'Profile',
      routeName: ProfilePage.routeName,
    ),
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ValenceHomeHeader(
            userName: 'Emilio Valence',
            hasUnreadNotifications: true,
          ),
          AppSpacing.gapL,
          const BalanceCard(
            balance: 28459.80,
            cardNumber: '4485123456789012',
            holderName: 'Emilio Valence',
            expiryDate: '08/29',
          ),
          AppSpacing.gapL,
          const SectionHeader(title: 'Quick Actions'),
          AppSpacing.gapM,
          const QuickActionGrid(actions: _actions),
          AppSpacing.gapL,
          SectionHeader(
            title: 'Recent Transactions',
            actionLabel: 'View all',
            onActionTap: () =>
                Navigator.of(context).pushNamed(TransactionsPage.routeName),
          ),
          AppSpacing.gapS,
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
