import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/transfer/presentation/pages/confirm_transfer_page.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  static const routeName = '/transfer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Transfer'),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send money', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Prepare a secure transfer from your Valence account.',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.gapL,
            AppCard(
              child: Column(
                children: [
                  const AppTextField(
                    label: 'Destination Account',
                    hintText: 'Enter account number',
                    prefixIcon: Icons.account_balance_rounded,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  AppSpacing.gapM,
                  const AppTextField(
                    label: 'Recipient',
                    hintText: 'Recipient full name',
                    prefixIcon: Icons.person_rounded,
                    textInputAction: TextInputAction.next,
                  ),
                  AppSpacing.gapM,
                  const AppTextField(
                    label: 'Amount',
                    hintText: '\$0.00',
                    prefixIcon: Icons.attach_money_rounded,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  AppSpacing.gapM,
                  const AppTextField(
                    label: 'Concept',
                    hintText: 'What is this transfer for?',
                    prefixIcon: Icons.notes_rounded,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            PrimaryButton(
              label: 'Continue',
              icon: Icons.arrow_forward_rounded,
              gradient: AppColors.primaryGradient,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ConfirmTransferPage(),
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
