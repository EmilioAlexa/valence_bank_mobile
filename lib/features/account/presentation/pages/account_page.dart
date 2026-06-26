import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/formatters.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/dashboard_models.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/quick_action_grid.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/section_header.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const _actions = [
    QuickActionData(Icons.swap_horiz_rounded, 'Transfer'),
    QuickActionData(Icons.credit_card_rounded, 'Cards'),
    QuickActionData(Icons.lock_rounded, 'Security'),
    QuickActionData(Icons.support_agent_rounded, 'Support'),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ValenceAppBar(title: 'Account', showBackButton: false),
          AppSpacing.gapM,
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.primaryGradient,
                  ),
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundColor: AppColors.primaryLighter,
                    child: Icon(
                      Icons.person_rounded,
                      color: AppColors.primary,
                      size: 52,
                    ),
                  ),
                ),
                AppSpacing.gapM,
                Text('Emilio Valence', style: AppTextStyles.headlineSmall),
                const SizedBox(height: 4),
                Text('Premium Checking', style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
          AppSpacing.gapL,
          AppCard(
            child: Column(
              children: [
                _AccountDetailRow(
                  label: 'Current Balance',
                  value: Formatters.currency(28459.80),
                  icon: Icons.account_balance_wallet_rounded,
                ),
                const Divider(height: 32),
                _AccountDetailRow(
                  label: 'Account Number',
                  value: Formatters.maskAccountNumber('904821763540'),
                  icon: Icons.pin_rounded,
                ),
                const Divider(height: 32),
                const _AccountDetailRow(
                  label: 'Creation Date',
                  value: 'March 14, 2024',
                  icon: Icons.calendar_month_rounded,
                ),
              ],
            ),
          ),
          AppSpacing.gapL,
          const SectionHeader(title: 'Quick Actions'),
          AppSpacing.gapM,
          const QuickActionGrid(actions: _actions),
          AppSpacing.gapXl,
        ],
      ),
    );
  }
}

class _AccountDetailRow extends StatelessWidget {
  const _AccountDetailRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

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
