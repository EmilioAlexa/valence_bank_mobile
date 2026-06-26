import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';
import '../../utils/formatters.dart';

/// The hero card shown on the dashboard summarizing total balance
/// and masked card number — an original Valence-branded take on a
/// banking "virtual card" component (not a copy of any reference
/// mockup), built from theme tokens so its gradient/typography stay
/// in sync with the rest of the app.
class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.holderName,
    this.cardLabel = 'VALENCE',
    this.expiryDate,
    this.isBalanceVisible = true,
    this.onToggleVisibility,
    this.gradient = AppColors.primaryGradient,
  });

  final double balance;
  final String cardNumber;
  final String holderName;
  final String cardLabel;
  final String? expiryDate;
  final bool isBalanceVisible;
  final VoidCallback? onToggleVisibility;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: AppRadius.radiusL,
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardLabel,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                  letterSpacing: 1.2,
                ),
              ),
              Icon(Icons.contactless_rounded, color: AppColors.white.withOpacity(0.85)),
            ],
          ),
          AppSpacing.gapL,
          Row(
            children: [
              Expanded(
                child: Text(
                  isBalanceVisible ? Formatters.currency(balance) : '••••••',
                  style: AppTextStyles.balanceDisplay,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onToggleVisibility != null)
                IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(
                    isBalanceVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: AppColors.white.withOpacity(0.85),
                  ),
                ),
            ],
          ),
          AppSpacing.gapL,
          Text(
            Formatters.cardNumber(cardNumber),
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.white,
              letterSpacing: 1.5,
            ),
          ),
          AppSpacing.gapM,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                holderName.toUpperCase(),
                style: AppTextStyles.labelMedium.copyWith(color: AppColors.white.withOpacity(0.85)),
              ),
              if (expiryDate != null)
                Text(
                  expiryDate!,
                  style: AppTextStyles.labelMedium.copyWith(color: AppColors.white.withOpacity(0.85)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
