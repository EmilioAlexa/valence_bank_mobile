import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/transfer/presentation/widgets/receipt_detail_row.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsivePage(
        child: Column(
          children: [
            AppSpacing.gapL,
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                gradient: AppColors.successGradient,
                borderRadius: AppRadius.radiusXl,
                boxShadow: AppShadows.raised,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.white,
                size: 62,
              ),
            ),
            AppSpacing.gapL,
            Text(
              'Transfer Successful',
              style: AppTextStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Your money has been sent securely.',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapL,
            AppCard(
              child: Column(
                children: const [
                  ReceiptDetailRow(
                    label: 'Reference Number',
                    value: 'VLB-260626-8472',
                  ),
                  Divider(height: 32),
                  ReceiptDetailRow(label: 'Date', value: 'June 26, 2026'),
                  Divider(height: 32),
                  ReceiptDetailRow(label: 'Time', value: '10:48 AM'),
                  Divider(height: 32),
                  ReceiptDetailRow(
                    label: 'Transferred Amount',
                    value: '\$1,250.00',
                    isAmount: true,
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            SecondaryButton(
              label: 'Share Receipt',
              icon: Icons.ios_share_rounded,
              onPressed: () {
                Navigator.of(context).maybePop();
              },
            ),
            AppSpacing.gapM,
            PrimaryButton(
              label: 'Return Home',
              icon: Icons.home_rounded,
              gradient: AppColors.primaryGradient,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}
