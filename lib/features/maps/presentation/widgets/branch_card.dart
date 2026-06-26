import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({
    super.key,
    required this.name,
    required this.address,
    required this.distance,
    required this.openUntil,
    required this.icon,
  });

  final String name;
  final String address;
  final String distance;
  final String openUntil;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryOpacity(0.1),
              borderRadius: AppRadius.radiusM,
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          AppSpacing.gapM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.titleSmall),
                const SizedBox(height: 3),
                Text(
                  address,
                  style: AppTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(distance, style: AppTextStyles.labelSmall),
                    const SizedBox(width: AppSpacing.s),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.textTertiary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s),
                    Flexible(
                      child: Text(
                        openUntil,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.success,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
