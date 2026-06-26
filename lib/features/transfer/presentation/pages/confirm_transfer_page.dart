import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/transfer/presentation/pages/transfer_success_page.dart';
import 'package:valence_mobile/features/transfer/presentation/widgets/pin_input.dart';
import 'package:valence_mobile/features/transfer/presentation/widgets/transfer_summary_card.dart';

class ConfirmTransferPage extends StatelessWidget {
  const ConfirmTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Confirm Transfer'),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Review details', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Confirm the transfer information before authorizing.',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.gapL,
            const TransferSummaryCard(
              recipient: 'Sofia Martinez',
              destinationAccount: '**** **** 5408',
              amount: '\$1,250.00',
            ),
            AppSpacing.gapL,
            Text('Security PIN', style: AppTextStyles.titleMedium),
            AppSpacing.gapM,
            const PinInput(),
            AppSpacing.gapL,
            PrimaryButton(
              label: 'Confirm',
              icon: Icons.verified_rounded,
              gradient: AppColors.primaryGradient,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const TransferSuccessPage(),
                  ),
                );
              },
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}
