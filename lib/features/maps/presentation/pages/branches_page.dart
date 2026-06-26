import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/dashboard/presentation/widgets/section_header.dart';
import 'package:valence_mobile/features/maps/presentation/widgets/branch_card.dart';

class BranchesPage extends StatelessWidget {
  const BranchesPage({super.key, this.showAppBar = false});

  static const routeName = '/branches';

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? const ValenceAppBar(title: 'Branches & ATMs') : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(routeName),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.my_location_rounded),
      ),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!showAppBar)
              const ValenceAppBar(
                title: 'Branches & ATMs',
                showBackButton: false,
              ),
            AppSpacing.gapM,
            const AppSearchField(
              hintText: 'Search branches, ATMs, or city',
              trailing: Icon(Icons.tune_rounded),
            ),
            AppSpacing.gapL,
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryLighter,
                    AppColors.surfaceVariant,
                  ],
                ),
                borderRadius: AppRadius.radiusL,
                boxShadow: AppShadows.card,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(painter: _MapGridPainter()),
                  ),
                  const Positioned(
                    left: 42,
                    top: 68,
                    child: _MapPin(active: true),
                  ),
                  const Positioned(
                    right: 58,
                    top: 112,
                    child: _MapPin(),
                  ),
                  const Positioned(
                    left: 112,
                    bottom: 58,
                    child: _MapPin(),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.s,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppRadius.radiusPill,
                        boxShadow: AppShadows.soft,
                      ),
                      child: Text(
                        'Map Placeholder',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            const SectionHeader(title: 'Nearby Branches'),
            AppSpacing.gapM,
            const BranchCard(
              icon: Icons.account_balance_rounded,
              name: 'Valence Centro',
              address: 'Av. Tulum 240, Cancun',
              distance: '0.8 km',
              openUntil: 'Open until 5:00 PM',
            ),
            AppSpacing.gapM,
            const BranchCard(
              icon: Icons.local_atm_rounded,
              name: 'Valence ATM Plaza',
              address: 'Plaza Las Americas, Main Hall',
              distance: '1.4 km',
              openUntil: 'Open 24 hours',
            ),
            AppSpacing.gapM,
            const BranchCard(
              icon: Icons.account_balance_rounded,
              name: 'Valence Puerto',
              address: 'Blvd. Kukulcan Km 7.5',
              distance: '3.2 km',
              openUntil: 'Open until 4:30 PM',
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  const _MapPin({this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 44 : 36,
      height: active ? 44 : 36,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        shape: BoxShape.circle,
        boxShadow: AppShadows.soft,
      ),
      child: Icon(
        Icons.location_on_rounded,
        color: active ? AppColors.white : AppColors.primary,
        size: active ? 24 : 20,
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.13)
      ..strokeWidth = 1.4;

    for (double x = -40; x < size.width; x += 72) {
      canvas.drawLine(Offset(x, 0), Offset(x + 120, size.height), paint);
    }
    for (double y = 38; y < size.height; y += 78) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y - 36), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
