import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/spacing.dart';
import '../../constants/theme/text_styles.dart';

class ValenceNavItem {
  const ValenceNavItem({required this.icon, required this.activeIcon, required this.label});

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

/// Custom bottom navigation bar for the primary app sections
/// (Home, Transactions, Maps/Branches, Profile, More). Built as a
/// floating pill-style bar so it reads as distinctly "Valence"
/// rather than a stock [BottomNavigationBar].
class ValenceBottomNavBar extends StatelessWidget {
  const ValenceBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<ValenceNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(AppSpacing.m, 0, AppSpacing.m, AppSpacing.m),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s, horizontal: AppSpacing.s),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: AppRadius.radiusXl,
          boxShadow: AppShadows.raised,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isActive = index == currentIndex;
            final item = items[index];

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: AppRadius.radiusM,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive ? AppColors.primary : AppColors.textTertiary,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: isActive ? AppColors.primary : AppColors.textTertiary,
                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
