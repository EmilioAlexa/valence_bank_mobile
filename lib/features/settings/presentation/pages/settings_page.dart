import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:valence_mobile/features/security/presentation/pages/security_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Settings'),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Preferences', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Manage your account experience and access controls.',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.gapL,
            AppCard(
              child: Column(
                children: [
                  ProfileMenuTile(
                    icon: Icons.notifications_rounded,
                    title: 'Notifications',
                    subtitle: 'Push, email, and transaction alerts',
                  ),
                  const Divider(height: 24),
                  ProfileMenuTile(
                    icon: Icons.shield_rounded,
                    title: 'Security',
                    subtitle: 'Fingerprint and PIN preferences',
                    onTap: () =>
                        Navigator.of(context).pushNamed(SecurityPage.routeName),
                  ),
                  const Divider(height: 24),
                  ProfileMenuTile(
                    icon: Icons.info_rounded,
                    title: 'About',
                    subtitle: 'App version and legal information',
                  ),
                  const Divider(height: 24),
                  ProfileMenuTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    subtitle: 'Return to the app entry point',
                    destructive: true,
                    onTap: () =>
                        Navigator.of(context).popUntil((route) => route.isFirst),
                  ),
                ],
              ),
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}
